//
//  MCSectionModel.m
//  SJListkit_Example
//
//  Created by suzhengquan on 2020/8/5.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCSectionModel.h"

@implementation MCSectionModel

- (CGSize)referenceSizeForHeader
{
    return CGSizeMake(0, 50);
}

- (CGSize)sizeForItem
{
    return CGSizeMake(100, 100);
}



@end
