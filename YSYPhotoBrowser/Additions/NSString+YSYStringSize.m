//
//  NSString+YSYStringSize.m
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/3/10.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "NSString+YSYStringSize.h"


@implementation NSString (YSYStringSize)

- (CGSize)ysy_boundingSizeWithWidth:(float)width fontSize:(float)fontSize {
    
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil];
    
    return rect.size;
}

@end
