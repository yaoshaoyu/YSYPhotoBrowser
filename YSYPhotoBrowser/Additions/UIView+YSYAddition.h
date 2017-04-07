//
//  UIView+YSYAddition.h
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/11.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (YSYAddition)

/**
 获取当前屏幕截图

 @return 当前屏幕截图
 */
- (UIImage *)ysy_snapshotImage;

/**
 裁切圆角
 
 @param corners 要裁切的角
 @param cornerRadii 圆角大小
 */
- (void)ysy_setRoundedWithRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

@end
