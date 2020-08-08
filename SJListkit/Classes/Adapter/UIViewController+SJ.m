//
//  UIViewController+SJ.m
//  SJListkit
//
//  Created by 苏正权 on 07/08/2020.
//

#import "UIViewController+SJ.h"
#import "SJDispatcher.h"
#import <objc/runtime.h>

@interface UIViewController ()

@property (nonatomic, strong) SJDispatcher *dispatcher;

@property (nonatomic, strong) UICollectionView *collectionView;

@end


@implementation UIViewController (SJ)

- (void)addAdapter:(NSArray <SJCollectionViewAdapter *>*)adapters
{
    for (SJCollectionViewAdapter *adapter in adapters) {
        [self.dispatcher digestAdapter:adapter];
    }
    [[self getCollectionView] reloadData];
}

- (UICollectionView *)getCollectionView
{
    if (!self.collectionView) {
        UICollectionViewFlowLayout *collectionLayout = [[UICollectionViewFlowLayout alloc]init];
        UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:collectionLayout];
        collection.dataSource = [self getDispatcher];
        collection.delegate = [self getDispatcher];
        collection.backgroundColor = [UIColor lightGrayColor];
        self.collectionView = collection;
    }
    return self.collectionView;
}

- (SJDispatcher *)getDispatcher
{
    if (!self.dispatcher) {
        SJDispatcher *dispatcher = [[SJDispatcher alloc]init];
        dispatcher.controllerDelegate = self;
        [self setDispatcher:dispatcher];
    }
    return self.dispatcher;
}

- (UICollectionView *)collectionView
{
    return objc_getAssociatedObject(self, @selector(collectionView));
}

- (void)setCollectionView:(UICollectionView *)collectionView
{
    objc_setAssociatedObject(self, @selector(collectionView), collectionView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setDispatcher:(SJDispatcher *)dispatcher
{
    objc_setAssociatedObject(self, @selector(dispatcher), dispatcher, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (SJDispatcher *)dispatcher
{
    return objc_getAssociatedObject(self, @selector(dispatcher));
}

@end
