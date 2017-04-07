//
//  YSYPhotoBrowserLoadingProcessView.m
//  YSYPhotoBrowser
//
//  Created by 吕成翘 on 17/3/22.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "YSYPhotoBrowserLoadingProcessView.h"


@implementation YSYPhotoBrowserLoadingProcessView

#pragma mark - CustomAccessors
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setLoadingProcess:(CGFloat)loadingProcess {
    _loadingProcess = loadingProcess;
    
    [self setNeedsDisplay];
    
}

#pragma mark - UIKit
- (void)drawRect:(CGRect)rect {
    
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat ringRadius = 24;
    CGFloat ringStartAngle = 0;
    CGFloat ringEndAngle = M_PI * 2;
    CGFloat ringLineWidth = 1.0;
    
    UIBezierPath *ringPath = [UIBezierPath bezierPath];
    [ringPath addArcWithCenter:center radius:ringRadius startAngle:ringStartAngle endAngle:ringEndAngle clockwise:YES];
    ringPath.lineWidth = ringLineWidth;
    
    [[UIColor whiteColor] setStroke];
    
    [ringPath stroke];
    
    
    CGFloat cakeRadius = 21;
    CGFloat cakeStartAngle = -M_PI_2;
    CGFloat cakeEndAngle = _loadingProcess * (M_PI * 2) - M_PI_2;
    
    UIBezierPath *cakePath = [UIBezierPath bezierPath];
    [cakePath addArcWithCenter:center radius:cakeRadius startAngle:cakeStartAngle endAngle:cakeEndAngle clockwise:YES];
    [cakePath addLineToPoint:center];
    
    if (_loadingProcess != 1) {
        [cakePath closePath];
    }
    
    [[UIColor whiteColor] setFill];
    
    [cakePath fill];
}

@end
