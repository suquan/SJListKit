//
//  SJClient.m
//  SJListkit
//
//  Created by suzhengquan on 2020/8/6.
//

#import "SJClient.h"

@implementation SJClient

-(SJClient *)initWithObject:(id)object
{
    if (self = [super init]) {
        self.object = object;
    }
    return self;
}

@end
