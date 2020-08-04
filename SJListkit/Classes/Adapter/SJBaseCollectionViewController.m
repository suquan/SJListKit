//
//  SJBaseCollectionViewController.m
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import "SJBaseCollectionViewController.h"

@interface SJBaseCollectionViewController ()<UICollectionViewDelegate>

@end

@implementation SJBaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                                 collectionViewLayout:self.collectionViewLayout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.backgroundColor = [UIColor colorWithRed:244 green:244 blue:244 alpha:1.0];
        _collectionView.alwaysBounceVertical = YES;
    }
    
    return _collectionView;
}

- (UICollectionViewFlowLayout *)collectionViewLayout {
    if (_collectionViewLayout == nil) {
        _collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    return _collectionViewLayout;
}

@end
