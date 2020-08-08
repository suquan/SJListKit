//
//  MCAdapter2.m
//  SJListkit_Example
//
//  Created by 苏正权 on 04/08/2020.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCAdapter2.h"
#import "MCAdapter2Protocol.h"
#import <SJListkit/SJServiceMacro.h>
#import "MCAdapter1Protocol.h"

@interface MCAdapter2 ()


@end

@implementation MCAdapter2

- (instancetype)init
{
    self = [super init];
    if (self) {
        ADD_SERVICE_CLIENT(MCAdapter2Protocol, self);
    }
    return self;
}


#pragma mark MCCollectionViewCellDelegate

- (void)MCCollectionViewCellClickBtn
{
    SJSERVICE_CALL_CLIENT(MCAdapter1Protocol, @selector(adapter1changeText), adapter1changeText);
}

@end
