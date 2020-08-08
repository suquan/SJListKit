//
//  MCCollectionViewCell.m
//  SJListkit_Example
//
//  Created by suzhengquan on 2020/8/3.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCCollectionViewCell.h"

@interface MCCollectionViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;

@property(nonatomic, strong) UIButton *btn;

@end

@implementation MCCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255.0) / 255.0
                                               green:arc4random_uniform(255.0) / 255.0
                                                blue:arc4random_uniform(255.0) / 255.0
                                               alpha:1.0];
        
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _titleLabel.numberOfLines = 1;
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];
        
        [self addSubview:self.btn];
        
    }
    return self;
}


- (void)setCellModel:(SJCollectionViewCellModel *)cellModel
{
    self.titleLabel.text = cellModel.dataModel;
}


- (UIButton *)btn
{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        _btn.frame = CGRectMake(10, 10, 40, 40);
        _btn.backgroundColor = [UIColor greenColor];
    }
    return _btn;
}

- (void)btnClick
{
    if ([self.cellDelegate respondsToSelector:@selector(MCCollectionViewCellClickBtn)]) {
        [self.cellDelegate MCCollectionViewCellClickBtn];
    }
}

@end
