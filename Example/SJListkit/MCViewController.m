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

@interface MCViewController ()

@property (nonatomic, strong) SJCollectionViewAdapter *adapter;

@end

@implementation MCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"SJListKit";
    
    self.adapter = [[SJCollectionViewAdapter alloc]init];
    self.adapter.collectionView = self.collectionView;
    self.adapter.collectionViewDelegate = self;
    self.adapter.delegate = self;
    [self buildData];
}

- (void)buildData
{
    NSMutableArray *sections = [NSMutableArray array];
    for (int section = 0; section < 4; section ++) {
        SJCollectionViewSectionModel *sectionModel = [[SJCollectionViewSectionModel alloc]init];
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
        [sections addObject:sectionModel];
    }
    
    self.adapter.sectionModels = sections;
    [self.collectionView reloadData];
}

@end
