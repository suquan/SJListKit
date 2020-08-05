//
//  SJCollectionViewCellProtocol.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SJCollectionCellModelProtocol <NSObject>

@property (nonatomic, strong) id dataModel;

@property (nonatomic, strong) Class cellClass;

@property (nonatomic,copy) NSString *identifier;

@property (nonatomic, assign) CGFloat *itemHeight;

@property (nonatomic, assign)CGSize sizeForItem;

@end

NS_ASSUME_NONNULL_END
