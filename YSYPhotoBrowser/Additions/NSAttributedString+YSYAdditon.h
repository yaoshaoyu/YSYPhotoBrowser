//
//  NSAttributedString+YSYAdditon.h
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/9.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSAttributedString (YSYAdditon)

/**
 使用图像和文本生成上下排列的属性文本

 @param image 图像
 @param imageSize 图像大小
 @param title 标题文字
 @param fontSize 标题文字大小
 @param titleColor 标题文字颜色
 @param spacing 图像和标题间距
 @return 属性文本
 */
+ (instancetype)ysy_imageTextWithImage:(UIImage *)image
                              imageSize:(CGSize)imageSize
                                title:(NSString *)title
                             fontSize:(CGFloat)fontSize
                           titleColor:(UIColor *)titleColor
                              spacing:(CGFloat)spacing;

@end

/**
 例子：
 
 NSAttributedString *attributedString = [NSAttributedString ysy_imageTextWithImage:[UIImage imageNamed:@"nike"] imageSize:CGSizeMake(100, 100) title:@"Nike" fontSize:20 titleColor:[UIColor blackColor] spacing:10];
 
 UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
 [button setAttributedTitle:attributedString forState:UIControlStateNormal];
 button.titleLabel.numberOfLines = 0;
 button.titleLabel.textAlignment = NSTextAlignmentCenter;
 [button sizeToFit];
 button.center = self.view.center;
 [self.view addSubview:button];
 */
