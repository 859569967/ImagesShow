# ImagesShow
ImagesShow
图片选择器：
1、从相册添加图片，并可以设置最大图片数

        //初始化
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


2、默认初始化时有图片：本地或者后台请求的网络图片

        //_file_pathArray存储的是本地图片
        if (_file_pathArray.count>0) {
            self.SelectImageView.ImgfilePath_Array=[_file_pathArray mutableCopy];
            [self.SelectImageView resetImages_with_filePath];
            
        }
 
        //_file_pathArray存储的是网络图片
        if (_file_pathArray.count>0) {
            [self.SelectImageView resetImagesWithNetUrlFilePathArray:_file_pathArray];
            
        }
     

3、实现代理回调，点击编辑和展示按钮实现相应功能
        #pragma mark - SelectPhotos Delegate  返回选择的图片地址数组
        - (void)imgfilePathArray:(NSMutableArray *)filePathArray
        heights:(float)heights {
        //更新高度
        CGRect imgViewFrame = self.imageSelectView.frame;
        imgViewFrame.size.height = heights;
        self.imageSelectView.frame = imgViewFrame;

        //返回选择的图片地址数组
        self.getFilePathArray = [filePathArray mutableCopy];

        //发送请求
        }
4、截图

 ![image](https://github.com/niexiaobo/ImagesShow/blob/master/SimulatoImages/Simulatoedit.png)
 ![image](https://github.com/niexiaobo/ImagesShow/blob/master/SimulatoImages/Simulatorshow.png)
 ![image](https://github.com/niexiaobo/ImagesShow/blob/master/SimulatoImages/Simulatorshowbig.png)
