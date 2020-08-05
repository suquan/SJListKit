//
//  SJCollectionViewAdapter.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import <Foundation/Foundation.h>
#import "SJCollectionViewSectionModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SJCollectionViewAdapterDelegate <NSObject>


@end

@interface SJCollectionViewAdapter : NSObject<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;

@property(nonatomic,weak)id <UICollectionViewDelegate> collectionViewDelegate;

@property (nonatomic,weak)id <SJCollectionViewAdapterDelegate> delegate;

@property (strong, nonatomic) NSArray <SJCollectionViewSectionModel *> *sectionModels;

- (SJCollectionViewSectionModel *)viewModelForSection:(NSInteger)section;

- (SJCollectionViewCellModel *)cellModelForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
