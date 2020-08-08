//
//  MCVTestHeader.m
//  SJListkit_Example
//
//  Created by 苏正权 on 08/08/2020.
//  Copyright © 2020 suquan. All rights reserved.
//

#import "MCVTestHeader.h"

@interface MCVTestHeader ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collection;

@end

@implementation MCVTestHeader

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
//    for (int i = 0; i < 5; i++) {
//
//    }
    
    [self.view addSubview:self.collection];
    [self.collection registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"123"];
    [self.collection registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"234"];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"123" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255.0) / 255.0
    green:arc4random_uniform(255.0) / 255.0
     blue:arc4random_uniform(255.0) / 255.0
    alpha:1.0];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"234" forIndexPath:indexPath];
        
        header.backgroundColor = [UIColor greenColor];
        return header;
    }
    return [UICollectionReusableView new];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 100);
}



- (UICollectionView *)collection
{
    if (!_collection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collection = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collection.delegate = self;
        _collection.dataSource = self;
    }
    return _collection;
}

@end
