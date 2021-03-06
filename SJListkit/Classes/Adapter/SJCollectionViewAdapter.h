//
//  SJCollectionViewAdapter.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import <Foundation/Foundation.h>
#import "SJCollectionViewSectionModel.h"
#import "SJCollectionViewHeaderFooterModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SJCollectionViewAdapterDelegate <NSObject>

@optional

- (CGSize)adaptersizeForItemWithCellModel:(SJCollectionViewCellModel *)cellModel;

- (UIEdgeInsets)adapterInsetForSection;

- (CGFloat)adapterMinimumLineSpacingForSection;

- (CGFloat)adapterMinimumInteritemSpacingForSection;

- (CGSize)adapterSizeForHeaderWithModel:(SJCollectionViewHeaderFooterModel *)headerModel;

- (CGSize)adapterSizeForFooterWithModel:(SJCollectionViewHeaderFooterModel *)footerModel;

@end

@interface SJCollectionViewAdapter : NSObject<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,SJCollectionViewAdapterDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;

@property(nonatomic,weak)id dispatcherDelegate;

@property (strong, nonatomic) NSMutableArray <SJCollectionViewSectionModel *> *sectionModels;

@property (strong, nonatomic)NSArray <SJCollectionViewSectionModel *> *allSectionModels;

- (SJCollectionViewSectionModel *)viewModelForSection:(NSInteger)section;

- (SJCollectionViewCellModel *)cellModelForItemAtIndexPath:(NSIndexPath *)indexPath;

- (void)reloadCurrentAdapter;

@end

NS_ASSUME_NONNULL_END
