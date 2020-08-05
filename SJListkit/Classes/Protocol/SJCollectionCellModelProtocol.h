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

@property (nonatomic, assign) Class cellClass;

@property (nonatomic,copy) NSString *identifier;


@end

NS_ASSUME_NONNULL_END
