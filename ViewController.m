//
//  ViewController.m
//  ImagesShow
//
//  Created by 博彦科技-聂小波 on 16/6/12.
//  Copyright © 2016年 bobo. All rights reserved.
//

#import "ViewController.h"
#import "SelectImageView.h"


@interface ViewController ()<SelectPhotosDelegate>
@property (nonatomic, strong)SelectImageView *SelectImageView;
@property (nonatomic, strong)NSMutableArray *file_path_array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self SelectImageViewInit];
      
}

- (void)SelectImageViewInit{
    self.SelectImageView.frame=CGRectMake(0, 100, Screen_width, 74);
    self.SelectImageView.hidden=NO;
    
    _file_pathArray=@[@"http://www.xiufa.com/BJUI/plugins/kindeditor_4.1.10/attached/image/20160427/20160427020344_22714.png",
                      @"http://www.xiufa.com/BJUI/plugins/kindeditor_4.1.10/attached/image/20160427/20160427020327_69298.png"];
    BOOL isLocalPics = NO;
    if (isLocalPics) {
        //_file_pathArray存储的是本地图片
        if (_file_pathArray.count>0) {
            self.SelectImageView.ImgfilePath_Array=[_file_pathArray mutableCopy];
            [self.SelectImageView resetImages_with_filePath];
            
        }
    }else{
        //_file_pathArray存储的是网络图片
        if (_file_pathArray.count>0) {
            [self.SelectImageView resetImagesWithNetUrlFilePathArray:_file_pathArray];
            
        }
        
    }
}


-(SelectImageView *)SelectImageView{
    if (!_SelectImageView) {
        _SelectImageView=[[SelectImageView alloc]init];
        _SelectImageView.delegate=self;
        //初始化并设置最大图片数4
        [_SelectImageView ImageView_init_max_imgs2:4];
        [self.view addSubview:_SelectImageView];
    }
    return _SelectImageView;
    
}

#pragma mark- SelectPhotos Delegate
//选择照片
-(void)addPicker:(UIImagePickerController *)picker{
    
    [self presentViewController:picker animated:YES completion:nil];
}
//拍照
-(void)addUIImagePicker:(UIImagePickerController *)picker{
    
    [self presentViewController:picker animated:YES completion:nil];
}
//返回选择的图片地址数组,用于提交
-(void)ImgfilePath_Array:(NSMutableArray *)filePath_Array heights:(float)heights{
    
    
    _file_path_array=[filePath_Array mutableCopy];
    
}
-(void)Close_keyboard{
    [self.view endEditing:YES];
    
}

@end
