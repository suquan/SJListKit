//
//  SJCollectionViewSectionModelProtocol.h
//  Pods
//
//  Created by suzhengquan on 2020/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SJCollectionViewSectionModelProtocol <NSObject>

- (UIEdgeInsets)insetForSection;

- (CGFloat)minimumLineSpacing;

- (CGFloat)minimumInteritemSpacing;

@end

NS_ASSUME_NONNULL_END
