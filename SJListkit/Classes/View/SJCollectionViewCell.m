//
//  SJCollectionViewCell.m
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import "SJCollectionViewCell.h"

@implementation SJCollectionViewCell

@synthesize cellModel;

@synthesize cellDelegate;

-(void)setCellModel:(id<SJCollectionViewCellProtocol>)newCellModel NS_REQUIRES_SUPER
{
    cellModel = newCellModel;
}

@end
