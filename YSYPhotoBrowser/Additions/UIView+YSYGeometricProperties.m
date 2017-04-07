//
//  UIView+YSYGeometricProperties.m
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/11.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "UIView+YSYGeometricProperties.h"


@implementation UIView (YSYGeometricProperties)

-(void)setX:(CGFloat)x {
    
    CGRect tempFrame = self.frame;
    tempFrame.origin.x = x;
    self.frame = tempFrame;
}

-(CGFloat)x {
    
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y {
    
    CGRect tempFrame = self.frame;
    tempFrame.origin.y = y ;
    self.frame = tempFrame;
}

-(CGFloat)y {
    
    return self.frame.origin.y;
}

-(void)setCenterX:(CGFloat)centerX {
    
    CGPoint tempFrame = self.center;
    tempFrame.x = centerX;
    self.center = tempFrame;
}

-(CGFloat)centerX {
    
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY {
    
    CGPoint tempFrame = self.center;
    tempFrame.y = centerY;
    self.center = tempFrame;
}

-(CGFloat)centerY {
    
    return self.center.y;
}

-(void)setWidth:(CGFloat)width {
    
    CGRect tempFrame = self.frame;
    tempFrame.size.width = width;
    self.frame = tempFrame;
}

-(CGFloat)width {
    
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height {
    
    CGRect tempFrame = self.frame;
    tempFrame.size.height = height;
    self.frame = tempFrame;
}

-(CGFloat)height {
    
    return self.frame.size.height;
}

-(void)setSize:(CGSize)size {
    
    CGRect tempFrame = self.frame;
    tempFrame.size = size;
    self.frame = tempFrame;
}

-(CGSize)size {
    
    return self.frame.size;
}

-(void)setOrigin:(CGPoint)origin {
    
    CGRect tempFrame = self.frame;
    tempFrame.origin = origin;
    self.frame = tempFrame;
}

- (CGPoint)origin {
    
    return self.frame.origin;
}


@end
