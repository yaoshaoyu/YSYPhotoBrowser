//
//  YSYPhotoBrowserCell.h
//  YSYPhotoBrowser
//
//  Created by 吕成翘 on 17/3/15.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YSYPhotoBrowserModel, YSYPhotoBrowserCell;


@protocol YSYPhotoBrowserCellDelegate <NSObject>

/**
 点击图片视图单元

 @param photoBrowserCell 图片视图单元
 */
- (void)photoBrowserCelldidSingleTapImageView:(YSYPhotoBrowserCell *)photoBrowserCell;

@end


@interface YSYPhotoBrowserCell : UICollectionViewCell

@property (nonatomic, weak) id<YSYPhotoBrowserCellDelegate> delegate;    // 代理

@property (nonatomic, strong) YSYPhotoBrowserModel *model;               // 模型
@property (nonatomic, strong, readonly) UIImageView *imageView;          // 展示视图

@end
