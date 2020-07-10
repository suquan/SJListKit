//
//  SJListTableViewModel.h
//  SJListkit
//
//  Created by suzhengquan on 2020/7/10.
//

#import <Foundation/Foundation.h>
#import "SJListCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJListTableViewModel : NSObject

- (instancetype)initWithCellViewModelClass:(Class )defaultCellViewModelClass;


#pragma mark - 数据便捷方法，可选择性重写，
#pragma mark -- tableViewCell 对应的原始数据相关操作方法，默认触发 tableView 的 reload 方法
#pragma mark -- 添加数据

- (void)addDataArray:(NSArray *)dataArray;

- (void)addDataArray:(NSArray *)dataArray
  cellViewModelClass:(Class)cellViewModelClass;

- (void)addDataArrayToNewSection:(NSArray *)dataArray;

- (void)addDataArrayToNewSection:(NSArray *)dataArray
              cellViewModelClass:(Class)cellViewModelClass;

- (void)addDataArray:(NSArray *)dataArray
           atSection:(NSInteger)section;

- (void)addDataArray:(NSArray *)dataArray
  cellViewModelClass:(Class)cellViewModelClass
           atSection:(NSInteger)section;

- (void)addDataArray:(NSArray *)dataArray
           atSection:(NSInteger)section
            rowIndex:(NSInteger)rowIndex;

- (void)addDataArray:(NSArray *)dataArray
  cellViewModelClass:(Class)cellViewModelClass
           atSection:(NSInteger)section
            rowIndex:(NSInteger)rowIndex;
@end

NS_ASSUME_NONNULL_END
