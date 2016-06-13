//
//  NXBShowImageView.m
//  PhotoDemo
//
//  Created by 聂小波MacPro on 15/11/23.
//  Copyright © 2015年 xiaowei project. All rights reserved.
//

#import "NXBShowImageView.h"
#import "PhotoCollection.h"
#define NXBScreenWidth [UIScreen mainScreen].bounds.size.width
#define NXBScreenHieght [UIScreen mainScreen].bounds.size.height
@interface NXBShowImageView ()

@property (nonatomic,strong)PhotoCollection *collectionView;
@property (nonatomic,strong)NSMutableArray *imageList;

@end
@implementation NXBShowImageView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
}
- (void)InitWith_superVC:(UIViewController*)superVC imageList:(NSMutableArray *)imageList Current_index:(long)Current_index{
    if (!self) {
        return;
    }
    self.frame=CGRectMake(0, 0, NXBScreenWidth, NXBScreenHieght);
    [superVC.view addSubview:self];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Touch_self_view)];
    [tap setNumberOfTapsRequired:1];
    [self addGestureRecognizer:tap];
    
    
    
    
    _imageList = [NSMutableArray array];
    _imageList=[imageList mutableCopy];
    
    
    //创建collectionView
    [self _createCollectionView];
    
    [_collectionView reloadData];
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:Current_index inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
}

- (void)Touch_self_view {
    [self removeFromSuperview];
}
- (void)_createCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake(NXBScreenWidth, NXBScreenHieght);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //创建图片显示视图
    _collectionView = [[PhotoCollection alloc]initWithFrame:CGRectMake(0, 0, NXBScreenWidth+10, NXBScreenHieght) collectionViewLayout:layout];
    _collectionView.pagingEnabled = YES;
    _collectionView.backgroundColor = [UIColor blackColor];
    _collectionView.imgArray = _imageList;
    [self addSubview:_collectionView];
    
    
}



@end
