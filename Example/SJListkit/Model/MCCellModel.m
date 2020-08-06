//
//  MCCellModel.m
//  SJListkit_Example
//
//  Created by suzhengquan on 2020/8/4.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCCellModel.h"

@implementation MCCellModel

- (Class)cellClass
{
    return NSClassFromString(@"MCCollectionViewCell");
}

- (NSString *)identifier
{
    return @"123";
}


@end
