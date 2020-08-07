//
//  MCFooterModel.m
//  SJListkit_Example
//
//  Created by 苏正权 on 08/08/2020.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCFooterModel.h"

@implementation MCFooterModel

- (Class)cellClass
{
    return NSClassFromString(@"MCFooterView");
}

- (NSString *)identifier
{
    return @"234";
}

@end
