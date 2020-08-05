//
//  SJCollectionViewHeaderFooterModel.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/5.
//

#import <Foundation/Foundation.h>
#import "SJCollectionCellModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJCollectionViewHeaderFooterModel : NSObject<SJCollectionCellModelProtocol>

@property (nonatomic, assign) Class headerFooterClass;

@end

NS_ASSUME_NONNULL_END
