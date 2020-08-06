//
//  SJClient.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJClient : NSObject

@property (nonatomic, weak) id object;

- (SJClient *)initWithObject:(id)object;

@end

NS_ASSUME_NONNULL_END
