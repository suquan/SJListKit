//
//  SJCollectionViewAdapter.m
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import "SJCollectionViewAdapter.h"
#import "SJCollectionViewCellProtocols.h"
#import "SJCollectionViewCell.h"
#import "SJCollectionViewSectionModel.h"

@interface SJCollectionViewAdapter ()


@end

static NSMutableArray<SJCollectionViewSectionModel *> *allSectionModels;

@implementation SJCollectionViewAdapter

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allSectionModels = [NSMutableArray array];
    });
}

- (void)setCollectionView:(UICollectionView *)collectionView
{
    _collectionView = collectionView;
//    collectionView.delegate = (id <UICollectionViewDelegate>)self.delegateInterceptor;
//    collectionView.dataSource = self;
//    collectionView.delegate = self;
}

-(void)setSectionModels:(NSArray<SJCollectionViewSectionModel *> *)sectionModels
{
    _sectionModels = sectionModels;
    [allSectionModels addObjectsFromArray:sectionModels];
}

#pragma mark UICollectionViewDelegate
//这里需要处理优先级，Adapter  优先级高低 cellModel/sectionModel > adapter 子类

/// 每个cell 的size

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return CGSizeMake(100, 100);
}

/// section 的上下左右 间距

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    SJCollectionViewSectionModel *sectionModel = allSectionModels[section];
    if ([sectionModel respondsToSelector:@selector(sectionInsets)]) {
        return [sectionModel sectionInsets];
    }
    
//    if (self respondsToSelector:@selector(<#selector#>)) {
//        <#statements#>
//    }
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


/// lineSpacing

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

/// itemSpacing

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

/// header 的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

/// footer 的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

#pragma mark private
- (void)_setupCellCountAndSectionCountForModels {
//    [self.sectionModels enumerateObjectsUsingBlock:^(YHCollectionViewSectionModel * sectionModel, NSUInteger section, BOOL * _Nonnull stop) {
//        sectionModel.numberOfSectionsInCollectionView = self.sectionModels.count;
//        sectionModel.section = section;
//
//        [sectionModel.cellModels enumerateObjectsUsingBlock:^(YHCollectionViewCellModel * cellModel, NSUInteger item, BOOL * _Nonnull stop) {
//            cellModel.numberOfItemsInSection = sectionModel.cellModels.count;
//            cellModel.indexPath = [NSIndexPath indexPathForItem:item inSection:section];
//        }];
//
//    }];
    
//    [self.sectionModels enumerateObjectsUsingBlock:^(SJCollectionViewSectionModel * _Nonnull sectionModel, NSUInteger idx, BOOL * _Nonnull stop) {
//        sectionModel.numberOfSectionsInAdapter = self.sectionModels.count;
//        [sectionModel.cellModels enumerateObjectsUsingBlock:^(SJCollectionViewCellModel * _Nonnull cellModel, NSUInteger idx, BOOL * _Nonnull stop) {
//           cellModel.
//        }];
//    }];
    
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

//- (MessageInterceptor *)delegateInterceptor {
//    if (_delegateInterceptor == nil) {
//        _delegateInterceptor = [[MessageInterceptor alloc] init];
//        _delegateInterceptor.middleMan = self;
////        _delegateInterceptor.receiver = self.collectionViewDelegate;
//    }
//    return _delegateInterceptor;
//}
@end
