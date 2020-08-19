//
//  SJDispatcher.m
//  SJListkit
//
//  Created by 苏正权 on 05/08/2020.
//


#import "SJDispatcher.h"
#import "SJCollectionViewSectionModel.h"
#import "SJCollectionReuseProtocols.h"
#import "SJMessageInterceptor.h"

@interface SJDispatcher ()

@property(nonatomic, strong) NSMutableDictionary <NSString *,SJCollectionViewAdapter *>*sectionDict;

@property (nonatomic, strong) SJMessageInterceptor *interceptor;

@property(nonatomic, strong) NSMutableArray <SJCollectionViewSectionModel *> *allSectionModels;

@property(nonatomic, strong) NSMutableArray <SJCollectionViewAdapter *> *allAdapters;

@end

@implementation SJDispatcher


//这里可以做两个维度的注册 一个是section和 adapter的对应 一个是 adapter 的Protocol 和 adapter 对应

- (void)digestAdapter:(SJCollectionViewAdapter *)adapter
{
    for (int i = 0; i < adapter.sectionModels.count; i++) {
        NSUInteger sectionIndex = i + self.allSectionModels.count;
        [self.sectionDict setValue:adapter forKey:[NSString stringWithFormat:@"%lu",(unsigned long)sectionIndex]];
    }
    [self.allSectionModels addObjectsFromArray:adapter.sectionModels];
    
}

- (void)digestAdapters:(NSArray<SJCollectionViewAdapter *> *)adapters
{
    [self.allAdapters removeAllObjects];
    [self.allAdapters addObjectsFromArray:adapters];
    [self updateDataSource];
}

///更新数据源
- (void)updateDataSource
{
    [self.allSectionModels removeAllObjects];
    [self.sectionDict removeAllObjects];
    for (int i = 0; i < self.allAdapters.count; i++) {
        SJCollectionViewAdapter *adapter = self.allAdapters[i];
        adapter.dispatcherDelegate = self;
        adapter.allSectionModels = self.allSectionModels;
        [self digestAdapter:self.allAdapters[i]];
    }
}

- (void)setControllerDelegate:(id)controllerDelegate
{
    _controllerDelegate = controllerDelegate;
    self.interceptor.secondInterceptor = controllerDelegate;
}


#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.allSectionModels.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.allSectionModels.count > section) {
        return self.allSectionModels[section].cellModels.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SJCollectionViewCellModel *cellModel = [self cellModelForIndexPath:indexPath];
    SJCollectionViewAdapter *adapter = [self adapterForIndexPath:indexPath];
    Class cellClass = cellModel.cellClass;
    if (cellClass) {
        [collectionView registerClass:cellClass forCellWithReuseIdentifier:cellModel.identifier];
        UICollectionViewCell <SJCollectionViewCellProtocol> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellModel.identifier forIndexPath:indexPath];
        
        if ([cell conformsToProtocol:@protocol(SJCollectionViewCellProtocol)]) {
            cell.cellModel = cellModel;
            cell.cellDelegate = adapter;
        }
        
        return cell;
    }
    return [[UICollectionViewCell alloc]init];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SJCollectionViewSectionModel *sectionModel = [self sectionModelForIndexPath:indexPath];
    SJCollectionViewAdapter *adapter = [self adapterForIndexPath:indexPath];
    if (kind == UICollectionElementKindSectionHeader) {
        
        SJCollectionViewHeaderFooterModel *headerModel = sectionModel.headerModel;
        
        if (headerModel.cellClass && headerModel.identifier) {
            [collectionView registerClass:headerModel.cellClass forSupplementaryViewOfKind:kind withReuseIdentifier:headerModel.identifier];
            
            UICollectionReusableView <SJCollectionViewHeaderFooterProtocol>*header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerModel.identifier forIndexPath:indexPath];
            
            if ([header conformsToProtocol:@protocol(SJCollectionViewHeaderFooterProtocol)]) {
                header.headerFooterModel = headerModel;
                header.headerFooterDelegate = adapter;
            }
            return header;
        }
        
        
    }else if (kind == UICollectionElementKindSectionFooter){
        SJCollectionViewHeaderFooterModel *footerModel = sectionModel.footerModel;
        
        if (footerModel.cellClass && footerModel.identifier) {
            [collectionView registerClass:footerModel.cellClass forSupplementaryViewOfKind:kind withReuseIdentifier:footerModel.identifier];
            
            UICollectionReusableView <SJCollectionViewHeaderFooterProtocol>*footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerModel.identifier forIndexPath:indexPath];
            
            if ([footer conformsToProtocol:@protocol(SJCollectionViewHeaderFooterProtocol)]) {
                footer.headerFooterModel = footerModel;
                footer.headerFooterDelegate = adapter;
            }
            return footer;
        }
    }
    return nil;
}


#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self updateInterceptorWithIndexPath:indexPath];
    if ([self.interceptor respondsToSelector:_cmd]) {
        [self.interceptor collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self updateInterceptorWithIndexPath:indexPath];
    if ([self.interceptor respondsToSelector:_cmd]) {
        return [self.interceptor collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
    }
    
    return CGSizeMake(0, 0);
}

/// section 的上下左右 间距

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    [self updateInterceptorWithSection:section];
    if ([self.interceptor respondsToSelector:_cmd]) {
        return [self.interceptor collectionView:collectionView layout:collectionViewLayout insetForSectionAtIndex:section];
    }
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


/// lineSpacing

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    [self updateInterceptorWithSection:section];
    if ([self.interceptor respondsToSelector:_cmd]) {
        return [self.interceptor collectionView:collectionView layout:collectionViewLayout minimumLineSpacingForSectionAtIndex:section];
    }
    
    return 0;
}

/// itemSpacing

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    [self updateInterceptorWithSection:section];
    if ([self.interceptor respondsToSelector:_cmd]) {
        return [self.interceptor collectionView:collectionView layout:collectionViewLayout minimumInteritemSpacingForSectionAtIndex:section];
    }
    
    return 0;
}

/// header 的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    [self updateInterceptorWithSection:section];
    if ([self.interceptor respondsToSelector:_cmd]) {
        return [self.interceptor collectionView:collectionView layout:collectionViewLayout referenceSizeForHeaderInSection:section];
    }
    
    return CGSizeMake(0, 0);
}

/// footer 的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    [self updateInterceptorWithSection:section];
    if ([self.interceptor respondsToSelector:_cmd]) {
        return [self.interceptor collectionView:collectionView layout:collectionViewLayout referenceSizeForFooterInSection:section];
    }
    
    return CGSizeMake(0, 0);
}

#pragma mark private

- (SJCollectionViewSectionModel *)sectionModelForIndexPath:(NSIndexPath *)indexPath
{
    return self.allSectionModels[indexPath.section];
}

- (SJCollectionViewCellModel *)cellModelForIndexPath:(NSIndexPath *)indexPath
{
    return self.allSectionModels[indexPath.section].cellModels[indexPath.row];
}

- (SJCollectionViewAdapter *)adapterForIndexPath:(NSIndexPath *)indexPath
{
    return [self.sectionDict objectForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.section]];
}

- (SJCollectionViewAdapter *)adapterForSection:(NSInteger)section
{
    return [self.sectionDict objectForKey:[NSString stringWithFormat:@"%ld",(long)section]];
}

- (void)updateInterceptorWithIndexPath:(NSIndexPath *)indexpath
{
    self.interceptor.firstInterceptor = [self adapterForIndexPath:indexpath];
}

- (void)updateInterceptorWithSection:(NSInteger)section
{
    self.interceptor.firstInterceptor = [self adapterForSection:section];
}

- (void)nullImplementcheckIInDebug
{
#ifdef DEBUG
    NSLog(@"%s",__func__);
    NSLog(@"%p",_cmd);
    NSAssert(NO, @"存在空实现");
#endif
}


#pragma mark getter

- (NSMutableDictionary *)sectionDict
{
    if (!_sectionDict) {
        _sectionDict = [NSMutableDictionary dictionary];
    }
    return _sectionDict;
}

- (NSMutableArray<SJCollectionViewSectionModel *> *)allSectionModels
{
    if (!_allSectionModels) {
        _allSectionModels = [NSMutableArray array];
    }
    return _allSectionModels;
}

- (SJMessageInterceptor *)interceptor
{
    if (!_interceptor) {
        _interceptor = [[SJMessageInterceptor alloc]init];
    }
    return _interceptor;
}

-(NSMutableArray<SJCollectionViewAdapter *> *)allAdapters
{
    if (!_allAdapters) {
        _allAdapters = [NSMutableArray array];
    }
    return _allAdapters;
}

@end
