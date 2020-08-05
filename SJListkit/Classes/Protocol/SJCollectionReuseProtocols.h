//
//  SJCollectionViewProtocols.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import <Foundation/Foundation.h>
#import "SJCollectionViewCellModel.h"
#import "SJCollectionViewHeaderFooterModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SJCollectionViewCellProtocol <NSObject>

@required

@property (nonatomic, strong) SJCollectionViewCellModel *cellModel;

@end

@protocol SJCollectionViewHeaderFooterProtocol <NSObject>

@required

@property (nonatomic, strong) SJCollectionViewHeaderFooterModel *viewModel;

@end

NS_ASSUME_NONNULL_END
