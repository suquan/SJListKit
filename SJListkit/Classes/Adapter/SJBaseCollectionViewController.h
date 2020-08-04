//
//  SJBaseCollectionViewController.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import <UIKit/UIKit.h>
#import "SJCollectionViewAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJBaseCollectionViewController : UIViewController

@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *collectionViewLayout;

- (void)addAdapter:(SJCollectionViewAdapter *)adapter;

@end

NS_ASSUME_NONNULL_END
