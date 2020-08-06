//
//  MCCollectionViewCell1.m
//  SJListkit_Example
//
//  Created by suzhengquan on 2020/8/4.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCCollectionViewCell1.h"

@interface MCCollectionViewCell1 ()

@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation MCCollectionViewCell1

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.titleLabel];
        
    }
    return self;
}


- (void)setCellModel:(SJCollectionViewCellModel *)cellModel
{
    self.titleLabel.text = cellModel.dataModel;
    [self.titleLabel sizeToFit];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}

@end
