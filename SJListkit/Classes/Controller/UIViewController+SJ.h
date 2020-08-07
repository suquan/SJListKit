//
//  UIViewController+SJ.h
//  SJListkit
//
//  Created by 苏正权 on 07/08/2020.
//

#import <UIKit/UIKit.h>
#import "SJCollectionViewAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (SJ)

- (UICollectionView *)getCollectionView;

- (void)addAdapter:(NSArray <SJCollectionViewAdapter *>*)adapters;

@end

NS_ASSUME_NONNULL_END
