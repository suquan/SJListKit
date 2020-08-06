//
//  SJCollectionViewSectionModel.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import <Foundation/Foundation.h>
#import "SJCollectionViewCellModel.h"
#import "SJCollectionSectionModelProtocol.h"
#import "SJCollectionViewHeaderFooterModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJCollectionViewSectionModel : NSObject<SJCollectionSectionModelProtocol>

@property (nonatomic, strong) NSMutableArray <SJCollectionViewCellModel *> *cellModels;

@property (nonatomic, strong) SJCollectionViewHeaderFooterModel *headerModel;

@property (nonatomic, strong) SJCollectionViewHeaderFooterModel *footerModel;

@property (copy, nonatomic) NSString *sectionIdentifier;// section 唯一标识符

@property (assign, nonatomic) NSInteger numberOfSectionsInAdapter;// 总共有多少section

@end

NS_ASSUME_NONNULL_END
