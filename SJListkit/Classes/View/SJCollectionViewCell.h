//
//  SJCollectionViewCell.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import <UIKit/UIKit.h>
#import "SJCollectionReuseProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJCollectionViewCell : UICollectionViewCell<SJCollectionViewCellProtocol>

-(void)setCellModel:(id<SJCollectionViewCellProtocol>)newCellModel NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
