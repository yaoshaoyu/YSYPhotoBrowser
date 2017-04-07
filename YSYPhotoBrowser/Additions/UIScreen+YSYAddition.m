//
//  UIScreen+YSYAddition.m
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/11.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "UIScreen+YSYAddition.h"


@implementation UIScreen (YSYAddition)

+ (CGFloat)ysy_screenWidth {
    
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)ysy_screenHeight {
    
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)ysy_scale {
    
    return [UIScreen mainScreen].scale;
}

@end
