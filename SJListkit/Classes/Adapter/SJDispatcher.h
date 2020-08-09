//
//  SJDispatcher.h
//  SJListkit
//
//  Created by 苏正权 on 05/08/2020.
//

#import <Foundation/Foundation.h>
#import "SJCollectionViewAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJDispatcher : NSObject<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,weak)id controllerDelegate;

- (void)digestAdapters:(NSArray<SJCollectionViewAdapter *> *)adapters;

- (void)updateDataSource;

@end

NS_ASSUME_NONNULL_END
