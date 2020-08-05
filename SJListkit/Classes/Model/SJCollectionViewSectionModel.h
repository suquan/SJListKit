//
//  SJCollectionViewSectionModel.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import <Foundation/Foundation.h>
#import "SJCollectionViewCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJCollectionViewSectionModel : NSObject

@property (nonatomic, strong) NSMutableArray <SJCollectionViewCellModel *> *cellModels;

@property (nonatomic, assign) Class headerClass;

@property (nonatomic, assign) Class footerClass;

// 布局相关

@property (nonatomic, assign) CGFloat minimumLineSpacing;

@property (nonatomic, assign) CGFloat minimumInteritemSpacing;

@property (nonatomic, assign) UIEdgeInsets sectionInsets;

@property (copy, nonatomic) NSString *sectionIdentifier;// section 唯一标识符

@property (assign, nonatomic) NSInteger numberOfSectionsInAdapter;// 总共有多少section



@end

NS_ASSUME_NONNULL_END
