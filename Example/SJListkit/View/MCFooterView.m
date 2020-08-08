//
//  MCFooterView.m
//  SJListkit_Example
//
//  Created by 苏正权 on 08/08/2020.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCFooterView.h"

@interface MCFooterView ()

@property (nonatomic, strong)UILabel *label;

@end

@implementation MCFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.label];
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void)setHeaderFooterModel:(SJCollectionViewHeaderFooterModel *)headerModel
{
    [super setHeaderFooterModel:headerModel];
    [self.label setText:headerModel.dataModel];
    [self.label sizeToFit];
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]init];
    }
    return _label;
}

@end
