//
//  SJListCellViewModel.h
//  SJListkit
//
//  Created by suzhengquan on 2020/7/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJListCellViewModel : NSObject

///不实现该方法，cell 将采用自适应高度
- (CGFloat)currentCellHeight;


///如果不实现该方法，请确保在 tableViewManager 中设置默认的 cellClass
- (NSString *)currentCellViewClassName;



@end

NS_ASSUME_NONNULL_END
