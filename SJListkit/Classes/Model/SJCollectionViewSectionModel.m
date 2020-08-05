//
//  SJCollectionViewSectionModel.m
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import "SJCollectionViewSectionModel.h"

@implementation SJCollectionViewSectionModel

- (UIEdgeInsets)insetForSection {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)minimumInteritemSpacing {
    return 0;
}

- (CGFloat)minimumLineSpacing {
    return 0;
}

- (CGSize)referenceSizeForFooter {
    return CGSizeZero;
}

- (CGSize)referenceSizeForHeader {
    return CGSizeZero;
}

- (CGSize)sizeForItem {
    return CGSizeZero;
}

@end
