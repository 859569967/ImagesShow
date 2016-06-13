//
//  XBSelectImageView.h
//  PhotoMutselect
//
//  Created by 聂小波MacPro on 15/11/7.
//  Copyright © 2015年 聂小波. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZYQAssetPickerController.h"
#import "NXBShowImageView.h"

//协议定义
@protocol SelectPhotosDelegate <NSObject>

-(void)addPicker:(ZYQAssetPickerController *)picker;          //UIImagePickerController
-(void)addUIImagePicker:(UIImagePickerController *)picker;


-(void)ImgfilePath_Array:(NSMutableArray *)filePath_Array heights:(float)heights;
-(void)Close_keyboard;
@end


@interface SelectImageView : UIView<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate,ZYQAssetPickerControllerDelegate>
//下拉菜单
@property (nonatomic, strong)UIActionSheet *myActionSheet;
@property (nonatomic, strong)NSString *filePath;

@property (nonatomic, strong) NSMutableArray *PhotoimgsArray;
@property (nonatomic, strong) NSMutableArray *ImgfilePath_Array;

@property (nonatomic, strong) NSMutableArray *imageViewsArray;

//最多可显示最大图片数
@property (nonatomic, assign) int max_Image_show;
//当前可选最大图片数
@property (nonatomic, assign) int maximumImage;


@property (nonatomic,strong)UIView *BlankImgV;

//遵循协议的一个代理变量定义
@property (nonatomic, weak) id<SelectPhotosDelegate> delegate;

@property(nonatomic,assign)CGRect defaultFrame;

#pragma mark- 图片宽度是定值63
-(void)ImageView_init_max_imgs2:(int)max_imgs;

//-(void)Data_init:(CGRect)rect;
- (void)resetImages;
#pragma  mark  显示本地图片
-(void)resetImages_with_filePath;

#pragma  mark  显示网络图片
-(void)resetImagesWithNetUrlFilePathArray:(NSArray*)FilePathArray;

#pragma mark - 设置当前编辑状态
- (void)resetEditState:(BOOL)isEdit;
@end
