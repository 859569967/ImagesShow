# ImagesShow
ImagesShow
图片选择器：
1、从相册添加图片，并可以设置最大图片数
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
     