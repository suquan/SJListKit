//
//  SJMessageForwarding.m
//  SJListkit
//
//  Created by suzhengquan on 2020/8/5.
//

#import "SJMessageInterceptor.h"

@implementation SJMessageInterceptor


@synthesize firstInterceptor;
@synthesize secondInterceptor;

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([firstInterceptor respondsToSelector:aSelector]) { return firstInterceptor; }
    if ([secondInterceptor respondsToSelector:aSelector]) { return secondInterceptor; }
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([firstInterceptor respondsToSelector:aSelector]) { return YES; }
    if ([secondInterceptor respondsToSelector:aSelector]) { return YES; }
    return [super respondsToSelector:aSelector];
}

@end
