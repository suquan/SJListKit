//
//  SJMessageForwarding.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 此类用来做消息快捷转发 同一个UICollectionView 的Delegate 可以被多个级别的类处理。这里确立优先级

@interface SJMessageInterceptor : NSObject<UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) id firstInterceptor;

@property (nonatomic, weak) id secondInterceptor;


@end

NS_ASSUME_NONNULL_END
