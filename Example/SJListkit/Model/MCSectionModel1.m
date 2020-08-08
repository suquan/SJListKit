//
//  MCSectionModel1.m
//  SJListkit_Example
//
//  Created by suzhengquan on 2020/8/5.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCSectionModel1.h"

@implementation MCSectionModel1

- (CGSize)referenceSizeForFooter
{
    return CGSizeMake(0, 100);
}

- (CGSize)sizeForItem
{
    return CGSizeMake(200, 100);
}

@end
