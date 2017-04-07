//
//  YSYPhotoBrowserCell.m
//  YSYPhotoBrowser
//
//  Created by 吕成翘 on 17/3/15.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "YSYPhotoBrowserCell.h"
#import "YSYPhotoBrowserModel.h"
#import "YSYPhotoBrowserLoadingProcessView.h"

#import "SDWebImageManager.h"


typedef NS_ENUM(NSUInteger, YSYGestureRecognizerType) {
    YSYGestureRecognizerTypeUnknown,      // 未知手势
    YSYGestureRecognizerTypeSingleTap,    // 单击手势
    YSYGestureRecognizerTypeDoubleTap,    // 双击手势
    YSYGestureRecognizerTypePinch,        // 捏合手势
};


@interface YSYPhotoBrowserCell ()<UIActionSheetDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;                                 // 滑动视图
@property (nonatomic, strong) YSYPhotoBrowserLoadingProcessView *loadingProcessView;    // 进度视图
@property (nonatomic, strong) SDWebImageManager *webImageManager;

@end


@implementation YSYPhotoBrowserCell {
    CGPoint _imageViewAnchorPoint;                             // 图片视图锚点
    CGPoint _cellAnchorPoint;                                  // 单元视图锚点
    YSYGestureRecognizerType _currentGestureRecognizerType;    // 当前手势类型
}

#pragma mark - UIKit
- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - CustomAccessors
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
        [self setupGestureRecognizer];
        [self setupNotification];
        [self reset];
    }
    
    return self;
}

- (void)setModel:(YSYPhotoBrowserModel *)model {
    _model = model;
    
    _scrollView.frame = self.bounds;
    _scrollView.contentSize = model.imageSize;
    
    _imageView.image = model.thumbnailImage;
    _imageView.size = model.imageSize;
    
    if (model.isLongPicture) {
        _imageView.center = CGPointMake(kScreenWidth * 0.5, model.imageSize.height * 0.5);
    } else {
        _imageView.center = CGPointMake(kScreenWidth * 0.5, kScreenHeight * 0.5);
    }
    
    if (model.originalImageURLString && ![model.originalImageURLString isEqualToString:@""] && !model.hasOriginalImage) {
        
        _loadingProcessView = [[YSYPhotoBrowserLoadingProcessView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
        [self addSubview:_loadingProcessView];
        [self bringSubviewToFront:_loadingProcessView];
        
        _webImageManager = [SDWebImageManager sharedManager];
        [_webImageManager loadImageWithURL:[NSURL URLWithString:model.originalImageURLString] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                _loadingProcessView.loadingProcess = receivedSize * 1.0 / expectedSize;
            });
            
        } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
            
            [_loadingProcessView removeFromSuperview];
            
            _imageView.image = image;
            _model.originalImage = image;
        }];
    }
}

#pragma mark - Private
/**
 设置界面
 */
- (void)setupUI {
    
    self.backgroundColor = [UIColor clearColor];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:_scrollView];
    
    _imageView = [[UIImageView alloc] initWithFrame:_scrollView.bounds];
    _imageView.userInteractionEnabled = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_imageView];
}

/**
 设置手势
 */
- (void)setupGestureRecognizer {
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapAction:)];
    [self addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapAction:)];
    doubleTap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:doubleTap];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    [self addGestureRecognizer:pinch];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    [self addGestureRecognizer:longPress];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
}

/**
 设置通知
 */
- (void)setupNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(photoBrowserDidScroll:) name:YSYPhotoBrowserDidScrollNotification object:nil];
}

/**
 复位
 */
- (void)reset {
    
    _imageViewAnchorPoint = CGPointMake(0.5, 0.5);
    _cellAnchorPoint = CGPointMake(0.5, 0.5);
    _currentGestureRecognizerType = YSYGestureRecognizerTypeUnknown;
}

/**
 改变锚点
 
 @param gestureRecognizer 手势
 */
- (void)changeAnchorPointWithGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        
        CGPoint imageViewPoint = [gestureRecognizer locationOfTouch:0 inView:_imageView];
        _imageViewAnchorPoint.x = imageViewPoint.x / _model.imageSize.width;
        _imageViewAnchorPoint.y = imageViewPoint.y / _model.imageSize.height;
        
        CGPoint cellPoint = [gestureRecognizer locationOfTouch:0 inView:self];
        _cellAnchorPoint.x = cellPoint.x / self.width;
        _cellAnchorPoint.y = cellPoint.y / self.height;
        
    } else if ([gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]]) {
        
        CGPoint imageViewPoint1 = [gestureRecognizer locationOfTouch:0 inView:_imageView];
        CGPoint imageViewPoint2 = [gestureRecognizer locationOfTouch:1 inView:_imageView];
        _imageViewAnchorPoint.x = (imageViewPoint1.x + imageViewPoint2.x) / 2.0 / _model.imageSize.width;
        _imageViewAnchorPoint.y = (imageViewPoint1.y + imageViewPoint2.y) / 2.0 / _model.imageSize.height;
        
        CGPoint cellPoint1 = [gestureRecognizer locationOfTouch:0 inView:self];
        CGPoint cellPoint2 = [gestureRecognizer locationOfTouch:1 inView:self];
        _cellAnchorPoint.x = (cellPoint1.x + cellPoint2.x) / 2.0 / self.width;
        _cellAnchorPoint.y = (cellPoint1.y + cellPoint2.y) / 2.0 / self.height;
    }
}

/**
 缩放图片
 
 @param scale 缩放比
 */
- (void)zoomWithScale:(CGFloat)scale {
    
    _imageView.transform = CGAffineTransformScale(_imageView.transform, scale, scale);
    
    if (_currentGestureRecognizerType == YSYGestureRecognizerTypePinch && _imageView.width < kScreenWidth) {
        
        _imageView.centerX = kScreenWidth * 0.5;
        
        if (_imageView.height > kScreenHeight) {
            _imageView.centerY = _imageView.height * 0.5;
        } else {
            _imageView.centerY = kScreenHeight * 0.5;
        }
    } else {
        
        _imageView.x = 0.0;
        
        if (_imageView.height > kScreenHeight) {
            _imageView.y = 0.0;
        } else {
            _imageView.centerY = self.centerY;
        }
    }
    
    _scrollView.contentSize = _imageView.size;
    
    // 根据模拟锚点调整偏移量
    CGFloat offsetX = _imageView.width * _imageViewAnchorPoint.x - self.width * _cellAnchorPoint.x;
    CGFloat offsetY = _imageView.height * _imageViewAnchorPoint.y - self.height * _cellAnchorPoint.y;
    
    // 限定偏移量最大值
    if (ABS(offsetX) > ABS(_scrollView.contentSize.width - kScreenWidth)) {
        offsetX = offsetX > 0 ? _scrollView.contentSize.width - kScreenWidth : kScreenWidth - _scrollView.contentSize.width;
    }
    if (ABS(offsetY) > ABS(_scrollView.contentSize.height - kScreenHeight)) {
        offsetY = offsetY > 0 ? _scrollView.contentSize.height - kScreenHeight :
        kScreenHeight - _scrollView.contentSize.height;
    }
    
    // 只能向左上放大移动
    offsetX = offsetX < 0 ? 0 : offsetX;
    offsetY = offsetY < 0 ? 0 : offsetY;
    
    _scrollView.contentOffset = CGPointMake(offsetX, offsetY);
}

#pragma mark - ResponseEventAction
- (void)singleTapAction:(UITapGestureRecognizer *)gestureRecognizer {
    NSLog(@"单击了图片");
    
    _currentGestureRecognizerType = YSYGestureRecognizerTypeSingleTap;
    
    if ([_delegate respondsToSelector:@selector(photoBrowserCelldidSingleTapImageView:)]) {
        [_delegate photoBrowserCelldidSingleTapImageView:self];
    }
}

- (void)doubleTapAction:(UITapGestureRecognizer *)gestureRecognizer {
    NSLog(@"双击了图片");
    
    _currentGestureRecognizerType = YSYGestureRecognizerTypeDoubleTap;
    
    [self changeAnchorPointWithGestureRecognizer:gestureRecognizer];
    
    CGFloat scale = _imageView.width > _model.imageSize.width ? _model.imageSize.width / _imageView.width : YSYPhotoBrowserMaxScale;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [self zoomWithScale:scale];
    }];
}

- (void)pinchAction:(UIPinchGestureRecognizer *)gestureRecognizer {
    NSLog(@"捏合了图片");
    
    _currentGestureRecognizerType = YSYGestureRecognizerTypePinch;
    
    if (gestureRecognizer.numberOfTouches < 2) {
        [gestureRecognizer setCancelsTouchesInView:YES];
        [gestureRecognizer setValue:@(UIGestureRecognizerStateEnded) forKeyPath:@"state"];
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
        [self changeAnchorPointWithGestureRecognizer:gestureRecognizer];
        
        CGFloat scaleFactor = 1.0;
        if (gestureRecognizer.scale > 1.0 && _imageView.width > _model.imageSize.width * YSYPhotoBrowserMaxScale) {
            scaleFactor =  (1 + 0.01 * gestureRecognizer.scale) / gestureRecognizer.scale;
        }
        
        if (gestureRecognizer.scale < 1.0 && _imageView.width < _model.imageSize.width * YSYPhotoBrowserMinScale) {
            scaleFactor =  (1 - 0.01 * gestureRecognizer.scale) / gestureRecognizer.scale;
        }
        
        [self zoomWithScale:gestureRecognizer.scale * scaleFactor];
        
        gestureRecognizer.scale = 1.0;
        
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded ||
               gestureRecognizer.state == UIGestureRecognizerStateFailed ||
               gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
        
        float scale = 1.0;
        if (_imageView.width > _model.imageSize.width * YSYPhotoBrowserMaxScale) {
            scale = _model.imageSize.width * YSYPhotoBrowserMaxScale / _imageView.width;
        } else if (_imageView.width < _model.imageSize.width * YSYPhotoBrowserMinScale) {
            scale = _model.imageSize.width * YSYPhotoBrowserMinScale / _imageView.width;
        }
        
        [UIView animateWithDuration:0.25 animations:^{
            [self zoomWithScale:scale];
        }];
    }
}

- (void)longPressAction:(UILongPressGestureRecognizer *)gestureRecognizer {
    NSLog(@"长按了图片");
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"保存到相册" otherButtonTitles:nil];
        [actionSheet showInView:self];
    }
}

#pragma mark - NotificationEventAction
- (void)photoBrowserDidScroll:(NSNotification *)notification {
    
    UIScrollView *scrollView = (UIScrollView *)notification.object;
    
    BOOL isDeformation = !CGAffineTransformEqualToTransform(_imageView.transform, CGAffineTransformIdentity);
    BOOL isVisibleCell = (self.x <= scrollView.contentOffset.x - self.width - kYSYPhotoBrowserImageViewMargin || self.x >= scrollView.contentOffset.x + self.width + kYSYPhotoBrowserImageViewMargin);
    
    if (isDeformation && isVisibleCell) {
        [self zoomWithScale:_model.imageSize.width / _imageView.width];
    }
    
    if (isVisibleCell) {
        _scrollView.contentOffset = CGPointMake(0, 0);
    }
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0: {
            UIImageWriteToSavedPhotosAlbum(_imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
        }
            break;
        default:
            break;
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
}

@end
