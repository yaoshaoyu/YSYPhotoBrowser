//
//  NSString+YSYStringSize.h
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/3/10.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSString (YSYStringSize)

/**
 获取字符串的尺寸

 @param width 宽度
 @param fontSize 字体
 @return 尺寸
 */
- (CGSize)ysy_boundingSizeWithWidth:(float)width fontSize:(float)fontSize;

@end
