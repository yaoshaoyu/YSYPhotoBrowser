//
//  YSYPhotoBrowser.h
//  YSYPhotoBrowser
//
//  Created by 吕成翘 on 17/3/8.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YSYPhotoBrowser;


@protocol YSYPhotoBrowserDataSource <NSObject>

/**
 图片浏览器中图片的数量

 @param photoBrowser 图片浏览器
 @return 图片的数量
 */
- (NSInteger)numberOfItemsInPhotoBrowser:(YSYPhotoBrowser *)photoBrowser;

/**
 图片浏览器中的缩略图视图

 @param photoBrowser 图片浏览器
 @param index 索引
 @return 缩略图视图
 */
- (UIImageView *)photoBrowser:(YSYPhotoBrowser *)photoBrowser thumbnailForItemAtIndex:(NSInteger)index;

/**
 图片浏览器中原图的URL字符串

 @param photoBrowser 图片浏览器
 @param index 索引
 @return 原图的URL字符串
 */
- (NSString *)photoBrowser:(YSYPhotoBrowser *)photoBrowser originalPhotoURLStringForItemAtIndex:(NSInteger)index;

@end


@interface YSYPhotoBrowser : UIView

@property (nonatomic, weak) id<YSYPhotoBrowserDataSource> dataSource;                     // 数据源

@property (nonatomic, assign) NSInteger selectedIndex;                                    // 选中的索引
@property (nonatomic, assign) NSInteger numberOfVisibleItems;                             // 可视的图片数量

@property (nonatomic, assign, readonly) NSInteger numberOfItems;                          // 图片的数量
@property (nonatomic, copy, readonly) NSArray<UIImage *> *thumbnailImageList;             // 缩略图数组
@property (nonatomic, copy, readonly) NSArray<NSString *> *originalImageURLStringList;    // 原图地址数组

/**
 展示
 */
- (void)show;

@end
