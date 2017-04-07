//
//  YSYPhotoBrowserModel.h
//  YSYPhotoBrowser
//
//  Created by 吕成翘 on 17/3/15.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSYAdditions.h"


#define kYSYPhotoBrowserImageViewMargin 30                     // 图片间距
#define YSYPhotoBrowserBackgroundColor [UIColor blackColor]    // 背景颜色
#define YSYPhotoBrowserMaxScale 3.0                            // 最大倍数
#define YSYPhotoBrowserMinScale 1.0                            // 最小倍数
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenScale [UIScreen mainScreen].bounds.size.width / 375


extern NSString *const YSYPhotoBrowserDidScrollNotification;    // 图片浏览器滑动通知


@interface YSYPhotoBrowserModel : NSObject

@property (nonatomic, strong) UIImage *thumbnailImage;            // 缩略图
@property (nonatomic, copy) NSString *originalImageURLString;     // 原图地址字符串
@property (nonatomic, assign, readonly) CGSize imageSize;         // 图片尺寸
@property (nonatomic, assign, readonly) BOOL isLongPicture;       // 是否为长图
@property (nonatomic, strong) UIImage *originalImage;             // 原图
@property (nonatomic, assign, readonly) BOOL hasOriginalImage;    // 是否有原图

/**
 创建图片浏览器模型对象
 
 @param image 缩略图
 @param string 原图地址字符串
 @return 图片浏览器模型对象
 */
+ (instancetype)photoBrowserModelWithThumbnailImage:(UIImage *)image originalImageURLString:(NSString *)string;

@end
