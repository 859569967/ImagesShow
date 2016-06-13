//
//  NXBShowImageViewController.m
//  PhotoDemo
//
//  Created by 聂小波MacPro on 15/11/23.
//  Copyright © 2015年 xiaowei project. All rights reserved.
//

#import "NXBShowImageViewController.h"
#import "PhotoCollection.h"
#define XBScreenWidth [UIScreen mainScreen].bounds.size.width
#define XBScreenHieght [UIScreen mainScreen].bounds.size.height
@interface NXBShowImageViewController ()
@property (nonatomic,strong)PhotoCollection *collectionView;

@end

@implementation NXBShowImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor blackColor];
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Touch_self_view)];
    [tap setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tap];

    
    //数据加载
    [self _loadData];
}
- (void)Touch_self_view {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)_loadData{
    
//    _imageList = [NSMutableArray array];
//    for (NSInteger i=0; i<6; i++) {
//        NSString *imgName = [NSString stringWithFormat:@"%ld.jpg",i+1];
//        [_imageList addObject:imgName];
//    }
//    NSLog(@" %ld ",_imageList.count);
    
    //创建collectionView
    [self _createCollectionView];
    
    [_collectionView reloadData];
    if (!_Current_index) {
        _Current_index=0;
    }
    
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_Current_index inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}


- (void)_createCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake(XBScreenWidth, XBScreenHieght);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //创建图片显示视图
    _collectionView = [[PhotoCollection alloc]initWithFrame:CGRectMake(0, 0, XBScreenWidth+10, XBScreenHieght) collectionViewLayout:layout];
    _collectionView.pagingEnabled = YES;
    _collectionView.backgroundColor = [UIColor blackColor];
    _collectionView.imgArray = _imageList;
    [self.view addSubview:_collectionView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
