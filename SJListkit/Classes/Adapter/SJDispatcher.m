//
//  SJDispatcher.m
//  SJListkit
//
//  Created by 苏正权 on 05/08/2020.
//


#import "SJDispatcher.h"

@interface SJDispatcher ()

@property(nonatomic, strong) NSMutableDictionary *dict;

@end

@implementation SJDispatcher

//这里可以做两个维度的注册 一个是section和 adapter的对应 一个是 adapter 的Protocol 和 adapter 对应

- (void)digestAdapter:(SJCollectionViewAdapter *)adapter
{
    for (<#initialization#>; <#condition#>; <#increment#>) {
        <#statements#>
    }
}

@end
