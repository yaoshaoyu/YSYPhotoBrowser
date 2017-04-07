//
//  UIColor+YSYAddition.m
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/11.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "UIColor+YSYAddition.h"


@implementation UIColor (YSYAddition)

+ (instancetype)ysy_colorWithHex:(uint32_t)hex alpha:(float)alpha {
    
    uint8_t r = (hex & 0xff0000) >> 16;
    uint8_t g = (hex & 0x00ff00) >> 8;
    uint8_t b = hex & 0x0000ff;
    
    return [self ysy_colorWithRed:r green:g blue:b alpha:alpha];
}

+ (instancetype)ysy_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(float)alpha {
    
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

+ (instancetype)ysy_randomColor {
    
    return [UIColor ysy_colorWithRed:arc4random_uniform(256) green:arc4random_uniform(256) blue:arc4random_uniform(256) alpha:1.0];
}

+ (instancetype)ysy_baseColor {
    
    return [UIColor ysy_colorWithHex:0x0db8f6 alpha:1.0];
}

@end
