//
//  MCAdapter1.m
//  SJListkit_Example
//
//  Created by 苏正权 on 04/08/2020.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCAdapter1.h"
#import <SJServiceMacro.h>
#import "MCSectionModel.h"

@implementation MCAdapter1

- (instancetype)init
{
    self = [super init];
    if (self) {
        ADD_SERVICE_CLIENT(MCAdapter1Protocol, self);
    }
    return self;
}

- (void)adapter1changeText
{
    NSLog(@"----");
    for (MCSectionModel *section in self.sectionModels) {
        NSString *str = section.headerModel.dataModel;
        section.headerModel.dataModel = [NSString stringWithFormat:@"suzhengquan-%@",str];
    }
    
    [self reloadCurrentAdapter];
}

@end
