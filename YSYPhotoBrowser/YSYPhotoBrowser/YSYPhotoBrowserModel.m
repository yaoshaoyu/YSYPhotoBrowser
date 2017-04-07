//
//  YSYPhotoBrowserModel.m
//  YSYPhotoBrowser
//
//  Created by 吕成翘 on 17/3/15.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "YSYPhotoBrowserModel.h"


NSString *const YSYPhotoBrowserDidScrollNotification = @"YSYPhotoBrowserDidScrollNotification";


@implementation YSYPhotoBrowserModel

#pragma mark - CustomAccessors
- (instancetype)init {
    if (self = [super init]) {
        
        _thumbnailImage = [UIImage new];
        _originalImageURLString = [NSString string];
        _imageSize = CGSizeZero;
        _isLongPicture = NO;
        _originalImage = [UIImage new];
        _hasOriginalImage = NO;
    }
    
    return self;
}

- (void)setThumbnailImage:(UIImage *)thumbnailImage {
    _thumbnailImage = thumbnailImage;
    
    float imageWidth = kScreenWidth;
    float imageHeight = kScreenWidth * thumbnailImage.size.height / thumbnailImage.size.width;
    CGSize imageSize = CGSizeMake(imageWidth, imageHeight);
    
    _imageSize = imageSize;
    
    if (imageHeight > kScreenHeight) {
        _isLongPicture = YES;
    } else {
        _isLongPicture = NO;
    }
}

- (void)setOriginalImage:(UIImage *)originalImage {
    _originalImage = originalImage;
    
    if (originalImage) {
        _hasOriginalImage = YES;
    } else {
        _hasOriginalImage = NO;
    }
}

#pragma mark - Public
+ (instancetype)photoBrowserModelWithThumbnailImage:(UIImage *)image originalImageURLString:(NSString *)string {
    
    YSYPhotoBrowserModel *model = [[YSYPhotoBrowserModel alloc] init];
    model.thumbnailImage = image;
    model.originalImageURLString = string;
    
    return model;
}

@end
