//
//  SJCollectionModelProtocol.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SJCollectionSectionModelProtocol <NSObject>


/// section item 的size
- (CGSize)sizeForItem;

/// section 的上下左右 间距
- (UIEdgeInsets)insetForSection;

/// section中 lineSpacing
- (CGFloat)minimumLineSpacing;

/// section 中 itemSpacing
- (CGFloat)minimumInteritemSpacing;

/// section 中 header 的大小
- (CGSize)referenceSizeForHeader;

/// section 中 footer 的大小
- (CGSize)referenceSizeForFooter;

@end

NS_ASSUME_NONNULL_END
