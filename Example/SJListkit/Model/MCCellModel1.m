//
//  MCCellModel1.m
//  SJListkit_Example
//
//  Created by suzhengquan on 2020/8/4.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCCellModel1.h"

@implementation MCCellModel1

- (Class)cellClass
{
    return  NSClassFromString(@"MCCollectionViewCell1");
}

- (NSString *)identifier
{
    return @"234";
}

- (CGSize)itemSize
{
    return CGSizeMake(100, 50);
}


@end
