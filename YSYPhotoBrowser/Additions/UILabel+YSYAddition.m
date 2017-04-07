//
//  UILabel+YSYAddition.m
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/11.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "UILabel+YSYAddition.h"


@implementation UILabel (YSYAddition)

+ (instancetype)ysy_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color {
    
    UILabel *label = [self new];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    label.numberOfLines = 0;
    [label sizeToFit];
    
    return label;
}

+ (instancetype)ysy_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing {
    
    UILabel *label = [[self alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    label.numberOfLines = 0;
    
    NSMutableAttributedString * attributedStringM = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle * paragraphStyleM = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyleM setLineSpacing:lineSpacing];
    [attributedStringM addAttribute:NSParagraphStyleAttributeName value:paragraphStyleM range:NSMakeRange(0, [text length])];
    
    [label setAttributedText:attributedStringM];
    [label sizeToFit];
    
    return label;
}

@end
