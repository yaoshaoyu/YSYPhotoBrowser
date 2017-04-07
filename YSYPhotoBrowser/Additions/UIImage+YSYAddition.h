//
//  UIImage+YSYAddition.h
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/11.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (YSYAddition)

/**
 以比例按照尺寸压缩图片

 @param scaleWidth 要压缩后的宽度
 @return 压缩好的图片
 */
- (UIImage *)ysy_scaleImageWithScaleWidth:(CGFloat)scaleWidth;
/**
 根据颜色生成图片

 @param color 颜色
 @param size 尺寸
 @return 图片
 */
- (UIImage*)ysy_imageWithColor:(UIColor*)color withSize:(CGSize)size;

@end
