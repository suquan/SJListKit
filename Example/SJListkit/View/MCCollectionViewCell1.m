//
//  MCCollectionViewCell1.m
//  SJListkit_Example
//
//  Created by suzhengquan on 2020/8/4.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCCollectionViewCell1.h"
#import "MCCellModel1.h"
#import "MCCellModel.h"

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

// 这个一个cell 可以处理多种不同的model 类型，可以做策略模式
-(void)setCellModel:(id<SJCollectionViewCellProtocol>)cellModel
{
    [super setCellModel:cellModel];
    if ([cellModel isKindOfClass:[MCCellModel1 class]]) {
        MCCellModel1 *model = (MCCellModel1 *)cellModel;
        self.titleLabel.text = model.dataModel;
        [self.titleLabel sizeToFit];
    }else if ([cellModel isKindOfClass:[MCCellModel class]]){// 不同的模型可以有不同的显示逻辑
//        ...
    }
    

}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}

@end
