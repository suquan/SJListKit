//
//  MCViewController.m
//  SJListkit
//
//  Created by suquan on 07/10/2020.
//  Copyright (c) 2020 suquan. All rights reserved.
//

#import "MCViewController.h"
#import <SJListkit/SJCollectionViewAdapter.h>
#import "MCCellModel.h"
#import "MCCellModel1.h"
#import "MCAdapter1.h"
#import "MCAdapter2.h"
#import "MCSectionModel.h"
#import "MCHeaderModel.h"
#import "MCSectionModel1.h"
#import <SJListkit/SJClient.h>
#import <SJListkit/UIViewController+SJ.h>
#import "MCFooterModel.h"

@interface MCViewController ()<UICollectionViewDelegate>

@property (nonatomic, strong) MCAdapter1 *adapter1;

@property (nonatomic, strong) MCAdapter2 *adapter2;

@end

@implementation MCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"SJListKit";
    
    [self.view addSubview:[self getCollectionView]];
    [self getCollectionView].frame = self.view.bounds;
    
    self.adapter1 = [[MCAdapter1 alloc]init];
    self.adapter1.collectionView = [self getCollectionView];
    self.adapter1.collectionViewDelegate = self;
    [self buildData1];
    
    self.adapter2 = [[MCAdapter2 alloc]init];
    self.adapter2.collectionView = [self getCollectionView];
    self.adapter2.collectionViewDelegate = self;
    [self buildData2];
    
    [self addAdapter:@[self.adapter1,self.adapter2]];
}

- (void)buildData1
{
    NSMutableArray *sections = [NSMutableArray array];
    for (int section = 0; section < 4; section ++) {
        MCSectionModel *sectionModel = [[MCSectionModel alloc]init];
        sectionModel.sectionIdentifier = [NSString stringWithFormat:@"section_id_%@", @(section)];
        NSMutableArray *rows = [NSMutableArray array];
        for (int row = 0; row < 5; row ++) {
            MCCellModel *cellModel = [[MCCellModel alloc]init];
            cellModel.dataModel = [NSString stringWithFormat:@"%i - %i", section, row];
            [rows addObject:cellModel];
            
            MCCellModel1 *cellModel1 = [[MCCellModel1 alloc]init];
            cellModel1.dataModel = [NSString stringWithFormat:@"%i - %i", section, row];
            [rows addObject:cellModel1];
        }
        sectionModel.cellModels = rows;
        MCHeaderModel *headerModel = [[MCHeaderModel alloc]init];
        headerModel.dataModel = [NSString stringWithFormat:@"header-%i",section];
        sectionModel.headerModel = headerModel;
        
        [sections addObject:sectionModel];
    }
    self.adapter1.sectionModels = sections;
//    [self addAdapter:@[self.adapter1]];
}


- (void)buildData2
{
    NSMutableArray *sections = [NSMutableArray array];
    for (int section = 0; section < 4; section ++) {
        MCSectionModel1 *sectionModel = [[MCSectionModel1 alloc]init];
        sectionModel.sectionIdentifier = [NSString stringWithFormat:@"section_id_%@", @(section)];
        NSMutableArray *rows = [NSMutableArray array];
        for (int row = 0; row < 5; row ++) {
            MCCellModel *cellModel = [[MCCellModel alloc]init];
            cellModel.dataModel = [NSString stringWithFormat:@"%i - %i", section, row];
            [rows addObject:cellModel];
            
            MCCellModel1 *cellModel1 = [[MCCellModel1 alloc]init];
            cellModel1.dataModel = [NSString stringWithFormat:@"%i - %i", section, row];
            [rows addObject:cellModel1];
        }
        sectionModel.cellModels = rows;
        
        MCFooterModel *footerModel = [[MCFooterModel alloc]init];
        footerModel.dataModel = [NSString stringWithFormat:@"header-%i",section];
        sectionModel.footerModel = footerModel;
        [sections addObject:sectionModel];
    }
    
    self.adapter2.sectionModels = sections;
//    [self addAdapter:self.adapter2];
}
@end
