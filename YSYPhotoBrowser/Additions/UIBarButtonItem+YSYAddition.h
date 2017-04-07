//
//  UIBarButtonItem+YSYAddition.h
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/11.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIBarButtonItem (YSYAddition)

/**
 创建图像导航栏按钮

 @param imageName 按钮图片名字
 @param target 按钮目标
 @param action 按钮响应
 @return 图像导航栏按钮
 */
- (instancetype)initWithImageName:(NSString *)imageName
                           target:(id)target
                           action:(SEL)action;

/**
 创建文本导航栏按钮

 @param title 按钮标题
 @param fontSize 按钮标题字体
 @param normalColor 按钮字体颜色
 @param selectedColor 按钮选中字体颜色
 @param target 按钮目标
 @param action 按钮响应
 @return 文本导航栏按钮
 */
- (instancetype)initWithTitle:(NSString *)title
                     fontSize:(CGFloat)fontSize
                  normalColor:(UIColor *)normalColor
                selectedColor:(UIColor *)selectedColor
                       target:(id)target
                       action:(SEL)action;

/**
 创建导航栏按钮

 @param title 按钮标题
 @param fontSize 按钮标题字体
 @param normalColor 按钮字体颜色
 @param selectedColor 按钮选中字体颜色
 @param imageName 按钮图片名字
 @param target 按钮目标
 @param action 按钮响应
 @return 导航栏按钮
 */
- (instancetype)initWithTitle:(NSString *)title
                     fontSize:(CGFloat)fontSize
                  normalColor:(UIColor *)normalColor
                selectedColor:(UIColor *)selectedColor
                    ImageName:(NSString *)imageName
                       target:(id)target
                       action:(SEL)action;

@end
