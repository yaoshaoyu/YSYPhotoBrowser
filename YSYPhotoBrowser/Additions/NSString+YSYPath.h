//
//  NSString+YSYPath.h
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/10.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (YSYPath)

/**
 获取沙盒文档路径

 @return 沙盒文档路径
 */
+ (NSString *)ysy_documentFilePath;

/**
 获取沙盒缓存路径

 @return 沙盒缓存路径
 */
+ (NSString *)ysy_cacheFilePath;

/**
 获取沙盒临时路径

 @return 沙盒临时路径
 */
+ (NSString *)ysy_temporaryFilePath;

/**
 给当前文件追加文档路径

 @return 完整的文档路径
 */
- (NSString *)ysy_appendDocumentDirectory;

/**
 给当前文件追加缓存路径

 @return 完整的缓存路径
 */
- (NSString *)ysy_appendCacheDirectory;

/**
 给当前文件追加临时路径

 @return 完整的临时路径
 */
- (NSString *)ysy_appendTempDirectory;

@end
