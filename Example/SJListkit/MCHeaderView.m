//
//  MCHeaderView.m
//  SJListkit_Example
//
//  Created by suzhengquan on 2020/8/5.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCHeaderView.h"

@interface MCHeaderView ()

@property (nonatomic, strong)UILabel *label;

@end

@implementation MCHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.label];
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}


- (void)setViewModel:(SJCollectionViewHeaderFooterModel *)viewModel
{
    [super setViewModel:viewModel];
    [self.label setText:viewModel.dataModel];
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]init];
    }
    return _label;
}


@end
