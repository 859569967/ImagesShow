//
//  XBSelectImageView.m
//  PhotoMutselect
//
//  Created by 聂小波MacPro on 15/11/7.
//  Copyright © 2015年 聂小波. All rights reserved.
//

#import "SelectImageView.h"
#define XBScreenWidth [UIScreen mainScreen].bounds.size.width
#define XBScreenHieght [UIScreen mainScreen].bounds.size.height
@implementation SelectImageView{

    
}

- (void)drawRect:(CGRect)rect {
    
    
}


-(void)Data_init:(CGRect)rect{
    self.backgroundColor=[UIColor whiteColor];
    
    [self ImageView_init_max_imgs:_max_Image_show];
    
    
//    int ImgX=20;
//    int ImgY=10;
//    _img1=[[UIImageView alloc]initWithFrame:CGRectMake(ImgX, ImgY, 60, 60)];
//    
//    [self addSubview:_img1];
//    [self ADDclosebnt_Frame:CGRectMake(ImgX+45, 0, 30, 30) Tag:1001];
//    
//    
//    ImgX+=75;
//    _img2=[[UIImageView alloc]initWithFrame:CGRectMake(ImgX, ImgY, 60, 60)];
//    [self addSubview:_img2];
//    [self ADDclosebnt_Frame:CGRectMake(ImgX+45, 0, 30, 30) Tag:1002];
//    ImgX+=75;
//    _img3=[[UIImageView alloc]initWithFrame:CGRectMake(ImgX, ImgY, 60, 60)];
//    [self addSubview:_img3];
//    [self ADDclosebnt_Frame:CGRectMake(ImgX+45, 0, 30, 30) Tag:1003];
//    ImgX+=75;
//    _img4=[[UIImageView alloc]initWithFrame:CGRectMake(ImgX, ImgY, 60, 60)];
//    [self addSubview:_img4];
//    [self ADDclosebnt_Frame:CGRectMake(ImgX+45, 0, 30, 30) Tag:1004];
//    
//    
//    _img1.image=[UIImage imageNamed:@"邻里圈创建_09.png"];
//    _PhotoimgsArray=[[NSMutableArray alloc]init];
//    _imageViewsArray=[[NSArray alloc]init];
//    _ImgfilePath_Array=[[NSMutableArray alloc]init];
//    //初始化图片
//    self.imageViewsArray = @[_img1,_img2,_img3,_img4];
//    
//    _maximumImage=4;
//    [self resetImages];

   
}
#pragma mark- 根据屏幕宽度设置图片
-(void)ImageView_init_max_imgs:(int)max_imgs{
     self.backgroundColor=[UIColor whiteColor];
    
    _PhotoimgsArray=[[NSMutableArray alloc]init];
    _imageViewsArray=[[NSMutableArray alloc]init];
    _ImgfilePath_Array=[[NSMutableArray alloc]init];
    
    
    int ImgX=20;
    int ImgY=10;
    int imgTag=90;
    int btnTag=1001;
    float img_w=0;
        //一行显示4张
        img_w=(Screen_width-(4+1)*ImgX)/4;
        
        for (int i=0; i<max_imgs; i++) {
            
            ImgX=20+(i%4)*(img_w+20);
            ImgY=10+(img_w+10)*(int)(i/4);
            imgTag+=i;
            
            [self ADDImage_and_bnt_ImgX:ImgX ImgY:ImgY imgTag:imgTag+i btnTag:btnTag+i img_w:img_w];
        }
    UIImageView *image1=[self viewWithTag:90];
    image1.image=[UIImage imageNamed:@"Addimages"];

//    _maximumImage=4;
    [self resetImages];
}
#pragma mark- 图片宽度是定值63
-(void)ImageView_init_max_imgs2:(int)max_imgs{
    self.backgroundColor=[UIColor whiteColor];
    
    _max_Image_show=max_imgs;
    
    _PhotoimgsArray=[[NSMutableArray alloc]init];
    _imageViewsArray=[[NSMutableArray alloc]init];
    _ImgfilePath_Array=[[NSMutableArray alloc]init];
    
    
    int ImgX=13;
    int ImgY=10;
    int imgTag=90;
    int btnTag=1001;
    float img_w=0;
    
    img_w=63;
    if (Screen_width<400) {//一行显示4张
        for (int i=0; i<max_imgs; i++) {
            
            ImgX=13+(i%4)*(img_w+13);
            ImgY=10+(img_w+10)*(int)(i/4);
            imgTag+=i;
            
            [self ADDImage_and_bnt_ImgX:ImgX ImgY:ImgY imgTag:imgTag+i btnTag:btnTag+i img_w:img_w];
        }

    }else{//一行显示5张
    
        for (int i=0; i<max_imgs; i++) {
            
            ImgX=13+(i%5)*(img_w+13);
            ImgY=10+(img_w+10)*(int)(i/5);
            imgTag+=i;
            
            [self ADDImage_and_bnt_ImgX:ImgX ImgY:ImgY imgTag:imgTag+i btnTag:btnTag+i img_w:img_w];
        }
    
    }
    
    
    
     UIImageView *image1=[self viewWithTag:90];
    image1.image=[UIImage imageNamed:@"Addimages"];
    
    //    _maximumImage=4;
    [self resetImages];
}

-(void)ADDImage_and_bnt_ImgX:(int)ImgX  ImgY:(int)ImgY imgTag:(int)imgTag btnTag:(int)btnTag img_w:(float)img_w{
    
    CGRect imgFrame=CGRectMake(ImgX, ImgY, img_w, img_w);
    CGRect btn_Frame=CGRectMake(ImgX+img_w-15, ImgY-10, 30, 30);
    
    UIImageView *imgV=[[UIImageView alloc]initWithFrame:imgFrame];
    imgV.tag=imgTag;
    [self addSubview:imgV];
    [_imageViewsArray addObject:imgV];
    
    
    UIButton *close=[[UIButton alloc]initWithFrame:btn_Frame];
    close.hidden=YES;
    close.tag=btnTag;
    [close setImageEdgeInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
    
    [close setImage:[UIImage imageNamed:@"close_R"] forState:UIControlStateNormal];
    
    [close addTarget:self action:@selector(closebnt_click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:close];
    
}



-(void)ADDclosebnt_Frame:(CGRect)Frame Tag:(int)tag{
    UIButton *close=[[UIButton alloc]initWithFrame:Frame];
    close.hidden=YES;
    close.tag=tag;
    [close setImageEdgeInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
    
    [close setImage:[UIImage imageNamed:@"close_R"] forState:UIControlStateNormal];
    
    [close addTarget:self action:@selector(closebnt_click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:close];

 
}
-(void)closebnt_click:(UIButton *)closebnt{
    long ii=closebnt.tag-1001;
    if (ii>=0) {
        
        if (ii<_PhotoimgsArray.count) {
             [_PhotoimgsArray removeObjectAtIndex:ii];
        }
        if (ii<_ImgfilePath_Array.count) {
             [_ImgfilePath_Array removeObjectAtIndex:ii];
        }
       
      }
    [self resetImages];
}
-(void)reset_closebnt{
    //默认编辑状态
    [self resetCloseBntEdit:YES];
    
}
-(void)resetCloseBntEdit:(BOOL)isEdit{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *But = (UIButton*)subView;
            But.hidden=YES;
        }
    }
    if (isEdit) {
        for (int i=1001; i<_PhotoimgsArray.count+1001; i++) {
            for (UIView *subView in self.subviews) {
                if ([subView isKindOfClass:[UIButton class]]) {
                    UIButton *But = (UIButton*)subView;
                    
                    if (But.tag==i) {
                        
                        But.hidden=NO;
                    }
                    
                }
            }
        }

    }
    
}

- (void)resetImages{
    //设置图片
    for (int i=0; i<_max_Image_show; i++) {
         UIImageView *images= [self.imageViewsArray objectAtIndex:i];
        [self clearImageAction:images];
        images.hidden=YES;
    }
    
    [self reset_closebnt];
    
    for (int i = 0; i < self.PhotoimgsArray.count+1; ++i) {
        if (i >= _max_Image_show) {
            break;
        }
        UIImageView *tempImgView = [self.imageViewsArray objectAtIndex:i];
        tempImgView.userInteractionEnabled = YES;
        tempImgView.contentMode = UIViewContentModeScaleAspectFill;
        tempImgView.clipsToBounds = YES;
        tempImgView.hidden=NO;
        UIImage *img;
        if (i == self.PhotoimgsArray.count) {
            img = [UIImage imageNamed:@"Addimages"];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickPic:)];
            tap.view.tag=90+i;
            [tempImgView addGestureRecognizer:tap];
        }else{
            //            NSString *fullPath = [self.PhotoimgsArray objectAtIndex:i];
            //            img = [[UIImage alloc] initWithContentsOfFile:fullPath];
            
            img =[_PhotoimgsArray objectAtIndex:i];
            
            tempImgView.tag=i;
            tempImgView.userInteractionEnabled = YES;
            tempImgView.contentMode = UIViewContentModeScaleAspectFill;
            tempImgView.clipsToBounds = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toImageDetail:)];
            [tempImgView addGestureRecognizer:tap];
        }
        [tempImgView setImage:img];
        
        [self sendfilePath_Array];
        
    }
}

- (void)resetImagesEdit:(BOOL)isEdit{
    for (int i = 0; i < self.PhotoimgsArray.count+1; ++i) {
        if (i >= _max_Image_show) {
            break;
        }
        UIImageView *tempImgView = [self.imageViewsArray objectAtIndex:i];
        
        if (i == self.PhotoimgsArray.count) {
            tempImgView.hidden=!isEdit;
        }
    }
}


- (void)sendfilePath_Array {
//    int ImgX=13;
    int ImgY=10;
    float img_w=0;
    //一行显示4张
//    img_w=(Screen_width-(4+1)*ImgX)/4;
    
     img_w=63;
    
    
     if (Screen_width<400) {//一行显示4张
         ImgY+=(img_w+10)*((int)(_ImgfilePath_Array.count/4)+1);
         
     }else{
     ImgY+=(img_w+10)*((int)(_ImgfilePath_Array.count/5)+1);
     }
    if ([_delegate respondsToSelector:@selector(ImgfilePath_Array:heights:)]) {
        [_delegate ImgfilePath_Array:_ImgfilePath_Array heights:ImgY];
    }
    
}

- (void)pickPic:(UIGestureRecognizer *)ges
{
    [self endEditing:YES];
    [_delegate Close_keyboard];
    _maximumImage=_max_Image_show-(int)_PhotoimgsArray.count;
    
    if (_maximumImage>0) {
        [self openMenu];
        
    }
    
}
-(void)openMenu{
    //在这里呼出下方菜单按钮项
    _myActionSheet = [[UIActionSheet alloc]
                     initWithTitle:nil
                     delegate:self
                     cancelButtonTitle:@"取消"
                     destructiveButtonTitle:nil
                     otherButtonTitles:@"打开照相机",@"从手机相册获取", nil];
    //
    [_myActionSheet showInView:self.window];
    
    
}
//下拉菜单的点击响应事件
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == _myActionSheet.cancelButtonIndex){
        NSLog(@"取消");
    }
    switch (buttonIndex) {
        case 0:
            [self takePhoto];
            break;
        case 1:
            [self localPhoto];
            break;
        default:
            break;
    }
}
//开始拍照
-(void)takePhoto{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self.delegate addUIImagePicker:picker];
        
        
    }else{
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}
//打开相册，可以多选
-(void)localPhoto{
    
    
    ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc]init];
    
    picker.maximumNumberOfSelection = _maximumImage;
    picker.assetsFilter = [ALAssetsFilter allPhotos];
    picker.showEmptyGroups = NO;
    picker.delegate = self;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject,NSDictionary *bindings){
        if ([[(ALAsset *)evaluatedObject valueForProperty:ALAssetPropertyType]isEqual:ALAssetTypeVideo]) {
            NSTimeInterval duration = [[(ALAsset *)evaluatedObject valueForProperty:ALAssetPropertyDuration]doubleValue];
            return duration >= 5;
        }else{
            return  YES;
        }
    }];
    
    [self.delegate addPicker:picker];
}
#pragma  mark   -ZYQAssetPickerController Delegate

/*
 得到选中的图片
 */
#pragma mark - ZYQAssetPickerController Delegate

-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    
    
            //后处理数据
        for (int i=0; i<assets.count; i++) {
            ALAsset *asset=assets[i];
            UIImage *tempImg=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
            
            NSString *jpgname = [NSString stringWithFormat:@"%d%d.jpg",(int)[[NSDate new] timeIntervalSince1970],i];
            NSLog(@"%@-----",jpgname);
//
//            NSData *datas;
//            if(UIImagePNGRepresentation(tempImg)==nil){
//                datas = UIImageJPEGRepresentation(tempImg, 1.0);
//            }else{
//                datas = UIImagePNGRepresentation(tempImg);
//            }
//            
//            //图片保存的路径
//            //这里将图片放在沙盒的documents文件夹中
//            NSString *DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
//            //文件管理器
//            NSFileManager *fileManager = [NSFileManager defaultManager];
//            //把刚才图片转换的data对象拷贝至沙盒中,并保存为image.png
//            [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
//            [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:[NSString stringWithFormat:@"%@",jpgname]] contents:datas attributes:nil];
//            //得到选择后沙盒中图片的完整路径
//            _filePath = [[NSString alloc]initWithFormat:@"%@/%@",DocumentsPath,jpgname];
//            
            
            
            [self saveImage:tempImg withName:jpgname];
            [_PhotoimgsArray addObject:tempImg];
            [self resetImages];
            

        }
    
   
   
  }


#pragma  mark  显示本地图片
-(void)resetImages_with_filePath{
    _PhotoimgsArray=[NSMutableArray new];
    for (int i=0; i<_ImgfilePath_Array.count; i++) {
        
//        UIImageView *imgView=[[UIImageView alloc]initWithImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_ImgfilePath_Array[i]]]]];
//        imgView.tag+=90+i;
////         UIImage *tempImg=[UIImage imageWithContentsOfFile:_ImgfilePath_Array[i]];
//        
//        
        
        UIImage *tempImg=[self getImageFileWithName:_ImgfilePath_Array[i]];
        UIImageView *imgView_temp= _imageViewsArray[i];
        imgView_temp.image=tempImg;

        if (tempImg) {
            [_PhotoimgsArray addObject:tempImg];
        }
        
    }
   
    [self resetImages];

}
-(UIImage*) getImageFileWithName:(NSString*)filePath

{
    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    
//    NSString *path = [paths objectAtIndex:0];
//    
//    NSString* filePath = [path stringByAppendingPathComponent:fileName];
//    
    NSError* err = [[NSError alloc] init];
    
    NSData* data = [[NSData alloc] initWithContentsOfFile:filePath
                    
                                                  options:NSDataReadingMapped
                    
                                                    error:&err];
    
    UIImage* img = nil;
    if(data != nil){
        img = [[UIImage alloc] initWithData:data];
    }else{
        NSLog(@"getImageFileWithName error code : %ld",(long)[err code]);
    }
    return img;
}

#pragma  mark  显示网络图片
-(void)resetImagesWithNetUrlFilePathArray:(NSArray*)FilePathArray{
    _PhotoimgsArray=[NSMutableArray new];
    for (int i=0; i<FilePathArray.count; i++) {
      
        UIImageView *imgView_temp= _imageViewsArray[i];
        
        [imgView_temp sd_setImageWithURL:[NSURL URLWithString:FilePathArray[i]] placeholderImage:[UIImage imageNamed:@"placehold_image"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            UIImage *tempImg=image;
            if (tempImg) {
                // 保存图片至本地，方法见下文
                NSString *jpgname = [NSString stringWithFormat:@"%d%d.jpg",(int)[[NSDate new] timeIntervalSince1970],i];
                [self saveImage:image withName:jpgname];
                
                [_PhotoimgsArray addObject:tempImg];
                
                [self resetImages];
            }
        }];
        
    }
    
}

#pragma mark - 设置当前编辑状态
- (void)resetEditState:(BOOL)isEdit {
    
    [self resetCloseBntEdit:isEdit];
    [self resetImagesEdit:isEdit];
}

#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    NSString *fullPath = [NSString stringWithFormat:@"%@/%@",ApplicationDelegate.folderPath,imageName];
    
    // 将图片写入文件
    [imageData writeToFile:fullPath atomically:NO];
    [_ImgfilePath_Array addObject:fullPath];
}

//打开相机 选择某张照片之后
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:^{
        
        //    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        //    // 保存图片至本地，方法见下文
        //    NSString *name = [NSString stringWithFormat:@"avatar_%d.jpg",(int)[[NSDate new] timeIntervalSince1970]];
        //    [self saveImage:image withName:name];
        //
        //    NSString *fullPath = [NSString stringWithFormat:@"%@/%@",ApplicationDelegate.folderPath,name];
        //
        //    _savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
        //
        //    _HeaderBGImg.image=_savedImage;
        
        
        
        
        //关闭相册界面
        //    [picker dismissViewControllerAnimated:YES completion:nil];
        NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
        //当选择的类型是图片
        if([type isEqualToString:@"public.image"]){
            
            
            UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
            // 保存图片至本地，方法见下文
             NSString *jpgname = [NSString stringWithFormat:@"%d.jpg",(int)[[NSDate new] timeIntervalSince1970]];
            [self saveImage:image withName:jpgname];
            
            [_PhotoimgsArray addObject:image];
            [self resetImages];

            
        }
    
    
       
    
    }];
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
//    NSLog(@"您取消了选择图片");
    
    
    [picker dismissViewControllerAnimated:YES completion:^{
      
        
    }];
   
}


- (void)reloadData {
    
}
- (void)dealloc {
    
      self.delegate = nil;
}





- (void)clearImageAction:(UIImageView *)img{
    img.image = nil;
    for (UIGestureRecognizer *ges in img.gestureRecognizers){
        [img removeGestureRecognizer:ges];
    }
}
#pragma mark - 查看 methods
- (void)toImageDetail:(UIGestureRecognizer *)ges{
    
    [_delegate performSelector:@selector(Close_keyboard)];
    
//    [self.imageViewsArray
    NXBShowImageView *tesnt=[[NXBShowImageView alloc]init];
    
    [tesnt InitWith_superVC:(UIViewController*)_delegate imageList:self.ImgfilePath_Array Current_index:ges.view.tag];
    //显示单张图片
//    [self showSingleImage:ges];

    
}
#pragma mark - 显示单张图片
-(void)showSingleImage:(UIGestureRecognizer *)ges{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _BlankImgV=[[UIView alloc]initWithFrame:window.frame];
    _BlankImgV.backgroundColor=[UIColor colorWithRed:1.f/255.f green:1.f/255.f blue:1.f/255.f alpha:1.0];
    UIImageView *tempImgV=(UIImageView *)ges.view;
    
    UIImageView *tempImgView =[[UIImageView alloc]initWithFrame:window.frame];
    tempImgView.contentMode = UIViewContentModeScaleAspectFit;
    
    tempImgView.image=tempImgV.image;
    [_BlankImgV addSubview:tempImgView];
    [window addSubview:_BlankImgV];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(HideImage)];
    
    [_BlankImgV addGestureRecognizer:tap];
}
-(void)HideImage{
    _BlankImgV.hidden=YES;
    [_BlankImgV removeFromSuperview];
    
}





- (void)delImg:(NSInteger)index{
    NSString *fullPath = [self.PhotoimgsArray objectAtIndex:index];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:fullPath]) {
        NSError *error;
        [fileManager removeItemAtPath:fullPath error:&error];
    }
    [self.PhotoimgsArray removeObjectAtIndex:index];
    [self resetImages];
}






@end
