//
//  SJBaseCollectionViewController.m
//  SJListkit
//
//  Created by suzhengquan on 2020/8/3.
//

#import "SJBaseCollectionViewController.h"
#import "SJDispatcher.h"

@interface SJBaseCollectionViewController ()<UICollectionViewDelegate>

@property (nonatomic,strong) SJDispatcher *dispatcher;

@end

@implementation SJBaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
}

- (void)addAdapter:(SJCollectionViewAdapter *)adapter
{
    [self.dispatcher digestAdapter:adapter];
    [self.collectionView reloadData];
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                                 collectionViewLayout:self.collectionViewLayout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.backgroundColor = [UIColor colorWithRed:244 green:244 blue:244 alpha:1.0];
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.dataSource = self.dispatcher;
        _collectionView.delegate = self.dispatcher;
    }
    
    return _collectionView;
}

- (UICollectionViewFlowLayout *)collectionViewLayout {
    if (_collectionViewLayout == nil) {
        _collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    return _collectionViewLayout;
}

- (SJDispatcher *)dispatcher
{
    if (!_dispatcher) {
        _dispatcher = [[SJDispatcher alloc]init];
        _dispatcher.controllerDelegate = self;
    }
    return _dispatcher;
}

@end
