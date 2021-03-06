//
//  SJServiceCenter.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/6.
//

#import <Foundation/Foundation.h>

typedef Protocol *SJServiceCenterKey;

NS_ASSUME_NONNULL_BEGIN

@interface SJServiceCenter : NSObject

+ (SJServiceCenter *)defaultCenter;

- (void)addClient:(id)client Key:(SJServiceCenterKey)key;

- (void)removeClientWithKey:(SJServiceCenterKey)key;

- (id )clientWithkey:(SJServiceCenterKey)key;

- (void)addNotifyingClient:(id)client Key:(SJServiceCenterKey)key;

- (NSHashTable *)notifyingClientsWithKey:(SJServiceCenterKey)key;


@end

NS_ASSUME_NONNULL_END
