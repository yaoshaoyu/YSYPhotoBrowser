//
//  YSYPhotoBrowserLayout.m
//  YSYPhotoBrowser
//
//  Created by 吕成翘 on 17/3/15.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "YSYPhotoBrowserLayout.h"
#import "YSYPhotoBrowserModel.h"


@implementation YSYPhotoBrowserLayout

- (void)prepareLayout{
    [super prepareLayout];
    
    CGSize selfSize = self.collectionView.bounds.size;
    
    self.itemSize = CGSizeMake(selfSize.width - kYSYPhotoBrowserImageViewMargin, selfSize.height);
    self.minimumLineSpacing = kYSYPhotoBrowserImageViewMargin;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
