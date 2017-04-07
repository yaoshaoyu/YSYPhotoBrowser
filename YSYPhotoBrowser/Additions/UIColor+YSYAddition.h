//
//  UIColor+YSYAddition.h
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/11.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (YSYAddition)

/**
 使用16进制创建颜色

 @param hex 16进制无符号32位整数
 @param alpha 透明度
 @return 颜色
 */
+ (instancetype)ysy_colorWithHex:(uint32_t)hex alpha:(float)alpha;

/**
 使用RGB创建颜色

 @param red 红色
 @param green 绿色
 @param blue 蓝色
 @param alpha 透明度
 @return 颜色
 */
+ (instancetype)ysy_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(float)alpha;

/**
 创建随机色

 @return 随机色
 */
+ (instancetype)ysy_randomColor;

/**
 创建主颜色

 @return 主颜色
 */
+ (instancetype)ysy_baseColor;

@end
