//
//  MCHeaderModel.m
//  SJListkit_Example
//
//  Created by suzhengquan on 2020/8/5.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCHeaderModel.h"

@implementation MCHeaderModel

- (Class)cellClass
{
    return NSClassFromString(@"MCHeaderView");
}

- (NSString *)identifier
{
    return @"header123";
}
@end
