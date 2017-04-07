//
//  NSAttributedString+YSYAdditon.m
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/9.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "NSAttributedString+YSYAdditon.h"


@implementation NSAttributedString (YSYAdditon)

+ (instancetype)ysy_imageTextWithImage:(UIImage *)image imageSize:(CGSize)imageSize title:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor spacing:(CGFloat)spacing {
    
    // 文本字典
    NSDictionary *titleDictionary = @{
                                      NSFontAttributeName : [UIFont systemFontOfSize:fontSize],
                                      NSForegroundColorAttributeName : titleColor
                                      };
    NSDictionary *spacingDictionary = @{
                                        NSFontAttributeName : [UIFont systemFontOfSize:spacing]
                                        };
    
    // 图片文本
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = CGRectMake(0, 0, imageSize.width, imageSize.height);
    
    NSAttributedString *imageText = [NSAttributedString attributedStringWithAttachment:attachment];
    
    // 换行文本
    NSAttributedString *lineText = [[NSAttributedString alloc] initWithString:@"\n\n" attributes:spacingDictionary];
    
    // 按钮文字
    NSAttributedString *text = [[NSAttributedString alloc] initWithString:title attributes:titleDictionary];
    
    // 合并文字
    NSMutableAttributedString *attributedStringM = [[NSMutableAttributedString alloc] initWithAttributedString:imageText];
    [attributedStringM appendAttributedString:lineText];
    [attributedStringM appendAttributedString:text];
    
    return attributedStringM.copy;
}

@end
