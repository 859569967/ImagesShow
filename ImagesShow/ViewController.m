//
//  ViewController.m
//  ImagesShow
//
//  Created by 博彦科技-聂小波 on 16/6/12.
//  Copyright © 2016年 bobo. All rights reserved.
//

#import "SelectImageView.h"
#import "ViewController.h"

@interface ViewController () <SelectPhotosDelegate>
@property(nonatomic, strong) SelectImageView *imageSelectView;
@property(nonatomic, strong) NSMutableArray *file_path_array;
@property(nonatomic, strong) UIButton *editEnableButton;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self imageSelectViewInit];
  [self.view addSubview:self.editEnableButton];
}

- (void)imageSelectViewInit {
  self.imageSelectView.frame = CGRectMake(0, 150, Screen_width, 400);
  self.imageSelectView.hidden = NO;

  _file_pathArray = @[
    @"http://www.xiufa.com/BJUI/plugins/kindeditor_4.1.10/attached/image/"
    @"20160427/20160427020344_22714.png",
    @"http://www.xiufa.com/BJUI/plugins/kindeditor_4.1.10/attached/image/"
    @"20160427/20160427020327_69298.png"
  ];
  BOOL isLocalPics = NO;
  if (isLocalPics) {
    //_file_pathArray存储的是本地图片
    if (_file_pathArray.count > 0) {
      self.imageSelectView.imgFilePathArray = [_file_pathArray mutableCopy];
      [self.imageSelectView resetImagesWithFilePath];
    }
  } else {
    //_file_pathArray存储的是网络图片
    if (_file_pathArray.count > 0) {
      [self.imageSelectView resetImagesWithNetUrlFilePathArray:_file_pathArray];
    }
  }
}

- (UIButton *)editEnableButton {
  if (!_editEnableButton) {
    _editEnableButton =
        [[UIButton alloc] initWithFrame:CGRectMake(50, 80, 120, 40)];
    [_editEnableButton setTitle:@"编辑模式" forState:UIControlStateSelected];
    [_editEnableButton setTitle:@"预览模式" forState:UIControlStateNormal];
    [_editEnableButton setTitleColor:[UIColor blueColor]
                            forState:UIControlStateSelected];
    [_editEnableButton addTarget:self
                          action:@selector(editEnableButtonClick)
                forControlEvents:UIControlEventTouchUpInside];
    [_editEnableButton setTitleColor:[UIColor redColor]
                            forState:UIControlStateNormal];
    [_editEnableButton setBackgroundColor:[UIColor yellowColor]];
    self.editEnableButton.selected = YES;
  }
  return _editEnableButton;
}

#pragma mark - 点击按钮
- (void)editEnableButtonClick {
  self.editEnableButton.selected = !self.editEnableButton.selected;
  [self.imageSelectView resetEditState:self.editEnableButton.selected];
}

#pragma mark - imageSelectView
- (SelectImageView *)imageSelectView {
  if (!_imageSelectView) {
    _imageSelectView = [[SelectImageView alloc] init];
    //第一步 注意：delegate 类型必须是UIViewController
    _imageSelectView.delegate = self;
    //第二步 初始化并设置最大图片数4
    [_imageSelectView imageViewInitMaxImages2:30 imgWidth:63.0];
    [self.view addSubview:_imageSelectView];
  }
  return _imageSelectView;
}

#pragma mark - SelectPhotos Delegate
//返回选择的图片地址数组,用于提交
- (void)imgfilePathArray:(NSMutableArray *)filePathArray
                 heights:(float)heights {

  _file_path_array = [filePathArray mutableCopy];
}

@end
