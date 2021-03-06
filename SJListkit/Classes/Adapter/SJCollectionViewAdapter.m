//
//  SJCollectionViewAdapter.m
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import "SJCollectionViewAdapter.h"
#import "SJCollectionViewCell.h"
#import "SJCollectionViewSectionModel.h"
#import "SJDispatcher.h"

@interface SJCollectionViewAdapter ()

@end


@implementation SJCollectionViewAdapter

#pragma mark UICollectionViewDelegate
//这里需要处理优先级，Adapter  优先级高低 cellModel/sectionModel > adapter 子类

/// 每个cell 的size

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SJCollectionViewSectionModel *sectionModel = self.allSectionModels[indexPath.section];
    
    SJCollectionViewCellModel *cellModel =  sectionModel.cellModels[indexPath.row];
    if ([cellModel respondsToSelector:@selector(itemSize)]) {
        if (!CGSizeEqualToSize([cellModel itemSize], CGSizeZero)) {
            return [cellModel itemSize];
        }
    }
    
    if ([sectionModel respondsToSelector:@selector(sizeForItem)]) {
        if (!CGSizeEqualToSize([sectionModel sizeForItem], CGSizeZero)) {
            return [sectionModel sizeForItem];
        }
    }
    
    if ([self respondsToSelector:@selector(adaptersizeForItemWithCellModel:)]) {
        return [self adaptersizeForItemWithCellModel:sectionModel.cellModels[indexPath.row]];
    }
    
    return CGSizeZero;
}

/// section 的上下左右 间距

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    SJCollectionViewSectionModel *sectionModel = self.allSectionModels[section];
    if ([sectionModel respondsToSelector:@selector(insetForSection)]) {
        if (!UIEdgeInsetsEqualToEdgeInsets([sectionModel insetForSection], UIEdgeInsetsZero)) {
            return [sectionModel insetForSection];
        }
    }
    
    if ([self respondsToSelector:@selector(adapterInsetForSection)]) {
        return [self adapterInsetForSection];
    }
    
    return UIEdgeInsetsZero;
}


/// lineSpacing

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    SJCollectionViewSectionModel *sectionModel = self.allSectionModels[section];
    if ([sectionModel respondsToSelector:@selector(minimumLineSpacing)]) {
        if ([sectionModel minimumLineSpacing] > 0) {
            return [sectionModel minimumLineSpacing];
        }
    }
    
    if ([self respondsToSelector:@selector(adapterMinimumLineSpacingForSection)]) {
        return [self adapterMinimumLineSpacingForSection];
    }
    return 0;
}

/// itemSpacing

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    SJCollectionViewSectionModel *sectionModel = self.allSectionModels[section];
    if ([sectionModel respondsToSelector:@selector(minimumInteritemSpacing)]) {
        if ([sectionModel minimumInteritemSpacing] > 0) {
            return [sectionModel minimumInteritemSpacing];
        }
    }
    
    if ([self respondsToSelector:@selector(adapterMinimumInteritemSpacingForSection)]) {
        return [self adapterMinimumInteritemSpacingForSection];
    }
    return 0;
}

/// header 的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    SJCollectionViewSectionModel *sectionModel = self.allSectionModels[section];
    
    if ([sectionModel respondsToSelector:@selector(referenceSizeForHeader)]) {
        if (!CGSizeEqualToSize([sectionModel referenceSizeForHeader], CGSizeZero)) {
            return [sectionModel referenceSizeForHeader];
        }
    }
    
    if ([self respondsToSelector:@selector(adapterSizeForHeaderWithModel:)]) {
        [self adapterSizeForHeaderWithModel:sectionModel.headerModel];
    }
    
    return CGSizeZero;
}

/// footer 的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    SJCollectionViewSectionModel *sectionModel = self.allSectionModels[section];
    if ([sectionModel respondsToSelector:@selector(referenceSizeForFooter)]) {
        if (!CGSizeEqualToSize([sectionModel referenceSizeForFooter], CGSizeZero)) {
            return [sectionModel referenceSizeForFooter];
        }
    }
    
    if ([self respondsToSelector:@selector(adapterSizeForFooterWithModel:)]) {
        [self adapterSizeForFooterWithModel:sectionModel.footerModel];
    }
    return CGSizeZero;
}

#pragma mark public

- (SJCollectionViewSectionModel *)viewModelForSection:(NSInteger)section
{
    if (self.sectionModels.count > section) {
        return self.sectionModels[section];
    }
    return nil;
}

- (SJCollectionViewCellModel *)cellModelForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.sectionModels.count > indexPath.section &&
        self.sectionModels[indexPath.section].cellModels.count > indexPath.row) {
        
        return self.sectionModels[indexPath.section].cellModels[indexPath.row];
    }
    
    return nil;
}


/// TODO  局部刷新
- (void)reloadCurrentAdapter 
{
    
//    根据当前adapter的数据更新 索引 更新allSectionModels
//    for (NSNumber *index in self.indexsInAdapter) {
//        [allSectionModels removeObjectAtIndex:index.intValue];
//    }
//    NSNumber *firstIndex = self.indexsInAdapter.firstObject;
//    [self.indexsInAdapter removeAllObjects];
//    
//    for (NSInteger i = self.sectionModels.count -1 ; i >= 0; i--) {
//        SJCollectionViewSectionModel *sectionModel = self.sectionModels[i];
//        [allSectionModels insertObject:sectionModel atIndex:firstIndex.intValue];
//        [self.indexsInAdapter insertObject:@(i + firstIndex.intValue) atIndex:0];
//    }
    
    if ([self.dispatcherDelegate respondsToSelector:@selector(updateDataSource)]) {
        [self.dispatcherDelegate updateDataSource];
    }
    
//    不完美的局部刷新
//    for (NSNumber *index in self.indexsInAdapter) {
//        NSIndexSet *set = [[NSIndexSet alloc]initWithIndex:index.intValue];
//        [self.collectionView reloadSections:set];
//    }
    [self.collectionView reloadData];
}


#pragma mark getter


@end
