//
//  YSYPhotoBrowser.m
//  YSYPhotoBrowser
//
//  Created by 吕成翘 on 17/3/8.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "YSYPhotoBrowser.h"
#import "YSYPhotoBrowserLayout.h"
#import "YSYPhotoBrowserCell.h"
#import "YSYPhotoBrowserModel.h"


static NSString *const cellID = @"cellID";    // 复用标识


@interface YSYPhotoBrowser ()<UICollectionViewDataSource, UICollectionViewDelegate, YSYPhotoBrowserCellDelegate>

@property (nonatomic, strong) UILabel *indexLabel;                 // 索引标签
@property (nonatomic, strong) UICollectionView *collectionView;    // 集合视图

@end


@implementation YSYPhotoBrowser {
    NSArray<YSYPhotoBrowserModel *> *_photoBrowserModelList;    // 图片浏览器模型数组
    NSArray<UIImageView *> *_thumbnailImageViewList;            // 缩略图视图数组
    BOOL _isFristShow;                                          // 判断是否是首次展示
}

#pragma mark - UIKit
- (void)didMoveToSuperview {
    
    [self loadDate];
    [self setupCollectionView];
    [self setupIndexLabel];
    [self setupNotification];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (!_isFristShow) {
        return;
    }
    
    // 点击图片后展示动画
    UIImageView *selectedImageView = _thumbnailImageViewList[_selectedIndex];
    UIImage *selectedImage = selectedImageView.image;
    CGRect thumbnailFrame = [selectedImageView.superview convertRect:selectedImageView.frame toView:[UIApplication sharedApplication].keyWindow];
    
    UIImageView *targetImageView = [[UIImageView alloc] initWithImage:selectedImage];
    targetImageView.frame = self.bounds;
    targetImageView.contentMode = UIViewContentModeScaleAspectFit;
    CGRect targetFrame = targetImageView.frame;
    
    float targetHeight = self.bounds.size.width / selectedImage.size.width * selectedImage.size.height;
    if (targetHeight > self.bounds.size.height) {
        targetFrame = CGRectMake(targetFrame.origin.x, targetFrame.origin.y, targetFrame.size.width, targetHeight);
    }
    
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:selectedImage];
    tempImageView.frame = thumbnailFrame;
    tempImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:tempImageView];
    
    [UIView animateWithDuration:0.25 animations:^{
        tempImageView.frame = targetFrame;
    } completion:^(BOOL finished) {
        _isFristShow = NO;
        [tempImageView removeFromSuperview];
        _collectionView.hidden = NO;
    }];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - CustomAccessors
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YSYPhotoBrowserBackgroundColor;
        _isFristShow = YES;
    }
    
    return self;
}

#pragma mark - Public
- (void)show {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    [window addSubview:self];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}

#pragma mark - Private
/**
 加载数据
 */
- (void)loadDate {
    
    if ([_dataSource respondsToSelector:@selector(numberOfItemsInPhotoBrowser:)]) {
        _numberOfItems = [_dataSource numberOfItemsInPhotoBrowser:self];
    } else {
        _numberOfItems = 0;
        return;
    }
    
    NSMutableArray<UIImage *> *imagesM = [NSMutableArray arrayWithCapacity:_numberOfItems];
    NSMutableArray<UIImageView *> *imageViewsM = [NSMutableArray arrayWithCapacity:_numberOfItems];
    NSMutableArray<NSString *> *URLStringsM = [NSMutableArray arrayWithCapacity:_numberOfItems];
    NSMutableArray<YSYPhotoBrowserModel *> *modelsM = [NSMutableArray arrayWithCapacity:_numberOfItems];
    
    for (NSInteger i = 0; i < _numberOfItems; i++) {
        
        UIImageView *thumbnailImageView = [UIImageView new];
        if ([_dataSource respondsToSelector:@selector(photoBrowser:thumbnailForItemAtIndex:)]) {
            thumbnailImageView = [_dataSource photoBrowser:self thumbnailForItemAtIndex:i] ? : [UIImageView new];
        }
        [imageViewsM addObject:thumbnailImageView];
        
        NSString *URLString = @"";
        if ([_dataSource respondsToSelector:@selector(photoBrowser:originalPhotoURLStringForItemAtIndex:)]) {
            URLString = [_dataSource photoBrowser:self originalPhotoURLStringForItemAtIndex:i] ? : @"";
        }
        [URLStringsM addObject:URLString];
        
        UIImage *image = thumbnailImageView.image ? : [UIImage new];
        [imagesM addObject:image];
        
        YSYPhotoBrowserModel *model = [YSYPhotoBrowserModel photoBrowserModelWithThumbnailImage:image originalImageURLString:URLString];
        [modelsM addObject:model];
    }
    
    _thumbnailImageList = [imagesM copy];
    _originalImageURLStringList = [URLStringsM copy];
    _thumbnailImageViewList = [imageViewsM copy];
    _photoBrowserModelList = [modelsM copy];
}

/**
 设置集合视图
 */
- (void)setupCollectionView {
    
    CGRect rect = self.bounds;
    float rectWidth = rect.size.width + kYSYPhotoBrowserImageViewMargin;
    float rectHeight = rect.size.height;
    
    YSYPhotoBrowserLayout *photoBrowserLayout = [YSYPhotoBrowserLayout new];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, rectWidth, rectHeight) collectionViewLayout:photoBrowserLayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.hidden = YES;
    _collectionView.pagingEnabled = YES;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, kYSYPhotoBrowserImageViewMargin);
    _collectionView.contentOffset = CGPointMake(_selectedIndex * rectWidth, 0);
    [_collectionView registerClass:[YSYPhotoBrowserCell class] forCellWithReuseIdentifier:cellID];
    [self addSubview:_collectionView];
}

/**
 设置索引标签
 */
- (void)setupIndexLabel {
    
    _indexLabel = [UILabel new];
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.textColor = [UIColor whiteColor];
    _indexLabel.font = [UIFont systemFontOfSize:20];
    _indexLabel.backgroundColor = [UIColor clearColor];
    _indexLabel.hidden = NO;
    _indexLabel.text = [NSString stringWithFormat:@"%ld/%ld", (_selectedIndex + 1), _numberOfItems];
    _indexLabel.center = CGPointMake(self.bounds.size.width * 0.5, 35);
    _indexLabel.bounds = CGRectMake(0, 0, 80, 30);
    [self addSubview:_indexLabel];
}

/**
 设置通知
 */
- (void)setupNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(screenWillRotation:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

/**
 重置界面
 */
- (void)resetupUI {
    
    // 重新加载数据计算图片尺寸
    [self loadDate];
    
    self.frame = [UIApplication sharedApplication].keyWindow.bounds;
    _indexLabel.center = CGPointMake(self.bounds.size.width * 0.5, 35);
    
    CGRect rect = self.bounds;
    float rectWidth = rect.size.width + kYSYPhotoBrowserImageViewMargin;
    float rectHeight = rect.size.height;
    _collectionView.frame = CGRectMake(0, 0, rectWidth, rectHeight);
    _collectionView.contentOffset = CGPointMake(_selectedIndex * rectWidth, 0);
    
    [_collectionView reloadData];
}

#pragma mark - NotificationEventAction
- (void)screenWillRotation:(NSNotification *)notification {
    
    UIDeviceOrientation orientenation = [UIDevice currentDevice].orientation;
    switch (orientenation) {
        case UIDeviceOrientationPortrait: {
            [self resetupUI];
        }
            break;
            
        case UIDeviceOrientationLandscapeLeft: {
            [self resetupUI];
        }
            break;
            
        case UIDeviceOrientationLandscapeRight: {
            [self resetupUI];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _photoBrowserModelList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YSYPhotoBrowserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.model = _photoBrowserModelList[indexPath.item];
    cell.delegate = self;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.isDragging) {
         
        [[NSNotificationCenter defaultCenter] postNotificationName:YSYPhotoBrowserDidScrollNotification object:scrollView];
        
        NSInteger index = (scrollView.contentOffset.x + _collectionView.bounds.size.width * 0.5) / _collectionView.bounds.size.width;
        _indexLabel.text = [NSString stringWithFormat:@"%ld/%ld", (index + 1), _numberOfItems];
        _selectedIndex = index;
    }
}

#pragma mark - YSYPhotoBrowserCellDelegate
- (void)photoBrowserCelldidSingleTapImageView:(YSYPhotoBrowserCell *)photoBrowserCell {
    
    UIImageView *currentImageView = photoBrowserCell.imageView;
    UIImage *currentImage = currentImageView.image;
    NSIndexPath *currentIndexPath = [_collectionView indexPathForCell:photoBrowserCell];
    NSInteger currentIndex = currentIndexPath.item;
    
    if (currentIndex < _numberOfVisibleItems) {
        
        _collectionView.hidden = YES;
        _indexLabel.hidden = YES;
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView *targetImageView = _thumbnailImageViewList[currentIndex];
        targetImageView.hidden = YES;
        CGRect targetFrame = [targetImageView.superview convertRect:targetImageView.frame toView:[UIApplication sharedApplication].keyWindow];
        
        UIImageView *tempImageView = [[UIImageView alloc] initWithImage:currentImage];
        tempImageView.contentMode = UIViewContentModeScaleAspectFit;
        tempImageView.frame = [currentImageView.superview convertRect:currentImageView.frame toView:[UIApplication sharedApplication].keyWindow];
        [self addSubview:tempImageView];
        
        float targetHeight = self.bounds.size.width / currentImage.size.width * currentImage.size.height;
        if (targetHeight > self.bounds.size.height) {
            tempImageView.contentMode = UIViewContentModeScaleToFill;
        }
        
        [UIView animateWithDuration:0.25 animations:^{
            tempImageView.frame = targetFrame;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            targetImageView.hidden = NO;
        }];
    } else {
        
        [UIView animateWithDuration:0.25 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}

@end
