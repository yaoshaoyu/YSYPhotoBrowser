//
//  ViewController.m
//  YSYPhotoBrowser
//
//  Created by 吕成翘 on 17/3/3.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "ViewController.h"
#import "YSYPhotoBrowser.h"


@interface ViewController ()<YSYPhotoBrowserDataSource>

@property (nonatomic, strong) UIImageView *imageView;

@end


@implementation ViewController {
    NSMutableArray<UIImageView *> *_imageViewList;
    NSMutableArray<NSString *> *_URLStringList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}

- (void)setupUI {
    
    _imageViewList = [NSMutableArray array];
    _URLStringList = [NSMutableArray array];
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"huangrong.jpg"]];
    _imageView.frame = CGRectMake(0, 0, 1024 / 3,  683 / 3);
    _imageView.userInteractionEnabled = YES;
    _imageView.tag = 0;
    NSString *URLString = @"https://imgsa.baidu.com/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=decd4b098e18367ab984778f4f1ae0b1/f3d3572c11dfa9ece48fd0376ad0f703918fc169.jpg";
    [self.view addSubview:_imageView];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hanxiaoying.jpg"]];
    imageView1.frame = CGRectMake(0, 683 / 3, 307 / 3, 450 / 3);
    imageView1.userInteractionEnabled = YES;
    imageView1.tag = 1;
    NSString *URLString1 = @"https://imgsa.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=c87257b8963df8dcb23087c3ac7819ee/8b13632762d0f7032932cc9301fa513d2797c5f9.jpg";
    [self.view addSubview:imageView1];
    
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hangrong1.jpg"]];
    imageView2.frame = CGRectMake(307 / 3, 683 / 3, 1440 / 6, 900 / 6);
    imageView2.userInteractionEnabled = YES;
    imageView2.tag = 2;
    NSString *URLString2 = @"https://imgsa.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=9a7a8bb0aacc7cd9ee203c8b58684a5a/d50735fae6cd7b89a884aade062442a7d8330e86.jpg";
    [self.view addSubview:imageView2];
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hua.jpg"]];
    imageView3.frame = CGRectMake(0, 683 / 3 + 450 / 3, 100, 100);
    imageView3.userInteractionEnabled = YES;
    imageView3.tag = 3;
    NSString *URLString3 = @"http://dasouji.com/wp-content/uploads/2015/07/%E9%95%BF%E8%8A%B1%E5%9B%BE-6.jpg";
    [self.view addSubview:imageView3];
    
    UIImageView *imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timg.jpg"]];
    imageView4.frame = CGRectMake(100, 683 / 3 + 450 / 3, 100, 100);
    imageView4.userInteractionEnabled = YES;
    imageView4.tag = 4;
    NSString *URLString4 = @"http://img.bbs.cnhubei.com/forum/dvbbs/2004-4/200441915031894.jpg";
    [self.view addSubview:imageView4];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
    [_imageView addGestureRecognizer:tap];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
    [imageView1 addGestureRecognizer:tap1];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
    [imageView2 addGestureRecognizer:tap2];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
    [imageView3 addGestureRecognizer:tap3];
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
    [imageView4 addGestureRecognizer:tap4];
    
    [_imageViewList addObject:_imageView];
    [_imageViewList addObject:imageView1];
    [_imageViewList addObject:imageView2];
    [_imageViewList addObject:imageView3];
    [_imageViewList addObject:imageView4];
    
    [_URLStringList addObject:URLString];
    [_URLStringList addObject:URLString1];
    [_URLStringList addObject:URLString2];
    [_URLStringList addObject:URLString3];
    [_URLStringList addObject:URLString4];
}

- (void)imageViewClick:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"图片被点了");
    
    YSYPhotoBrowser *photoBrower = [YSYPhotoBrowser new];
    photoBrower.selectedIndex = gestureRecognizer.view.tag;
    photoBrower.numberOfVisibleItems = _imageViewList.count;
    photoBrower.dataSource = self;
    [photoBrower show];
}

#pragma mark - YSYPhotoBrowserDataSource
- (NSInteger)numberOfItemsInPhotoBrowser:(YSYPhotoBrowser *)photoBrowser {
    return _imageViewList.count;
}

- (UIImageView *)photoBrowser:(YSYPhotoBrowser *)photoBrowser thumbnailForItemAtIndex:(NSInteger)index {
    return _imageViewList[index];
}

- (NSString *)photoBrowser:(YSYPhotoBrowser *)photoBrowser originalPhotoURLStringForItemAtIndex:(NSInteger)index {
    return _URLStringList[index];
}


@end
