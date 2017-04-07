//
//  UIImage+YSYAddition.m
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/11.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "UIImage+YSYAddition.h"


@implementation UIImage (YSYAddition)

- (UIImage *)ysy_scaleImageWithScaleWidth:(CGFloat)scaleWidth {
    
    CGFloat scaleHeight = scaleWidth / self.size.width * self.size.height;
    CGSize size = CGSizeMake(scaleWidth, scaleHeight);
    
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaleImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaleImage;
}

- (UIImage*)ysy_imageWithColor:(UIColor*)color withSize:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, [color CGColor]);
    CGContextFillRect(contextRef, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
