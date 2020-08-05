//
//  SJCollectionViewProtocols.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import <Foundation/Foundation.h>
#import "SJCollectionViewCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SJCollectionViewCellProtocols <NSObject>

@required

@property (nonatomic, strong) SJCollectionViewCellModel *cellModel;

@end

NS_ASSUME_NONNULL_END
