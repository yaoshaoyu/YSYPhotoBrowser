//
//  UIBarButtonItem+YSYAddition.m
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/11.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "UIBarButtonItem+YSYAddition.h"


@implementation UIBarButtonItem (YSYAddition)

- (instancetype)initWithImageName:(NSString *)imageName target:(id)target action:(SEL)action {
    
    if (self = [self init]) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        if (imageName) {
            [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        }
        
        UIImage *highlightedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]];
        if (highlightedImage) {
            [button setImage:highlightedImage forState:UIControlStateHighlighted];
        }
        
        if (target) {
            [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        }

        [button sizeToFit];
        
        self.customView = button;
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor target:(id)target action:(SEL)action {
    
    if (self = [self init]) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        if (title) {
            [button setTitle:title forState:UIControlStateNormal];
        }
        
        if (fontSize) {
            button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        }
        
        if (normalColor) {
            [button setTitleColor:normalColor forState:UIControlStateNormal];
        }
        
        if (selectedColor) {
            [button setTitleColor:selectedColor forState:UIControlStateHighlighted];
        }
        
        if (target) {
            [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        }
        
        [button sizeToFit];
        
        self.customView = button;
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor ImageName:(NSString *)imageName target:(id)target action:(SEL)action {
    
    if (self = [self init]) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        if (title) {
            [button setTitle:title forState:UIControlStateNormal];
        }
        
        if (fontSize) {
            button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        }
        
        if (normalColor) {
            [button setTitleColor:normalColor forState:UIControlStateNormal];
        }
        
        if (selectedColor) {
            [button setTitleColor:selectedColor forState:UIControlStateHighlighted];
        }
        
        if (imageName) {
            [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        }
        
        UIImage *_highlightedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]];
        if (_highlightedImage) {
            [button setImage:_highlightedImage forState:UIControlStateHighlighted];
        }
        
        if (target) {
            [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        }
        
        [button sizeToFit];
        
        self.customView = button;
    }
    
    return self;
}

@end
