//
//  UILabel+YSYAddition.h
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/11.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UILabel (YSYAddition)

/**
 创建标签

 @param text 文本
 @param fontSize 字体
 @param color 颜色
 @return 标签
 */
+ (instancetype)ysy_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color;

/**
 创建标签

 @param text 文本
 @param fontSize 字体
 @param color 颜色
 @param lineSpacing 行间距
 @return 标签
 */
+ (instancetype)ysy_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing;

@end
