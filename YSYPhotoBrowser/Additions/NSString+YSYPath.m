//
//  NSString+YSYPath.m
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/10.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "NSString+YSYPath.h"


@implementation NSString (YSYPath)

+ (NSString *)ysy_documentFilePath {
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
}

+ (NSString *)ysy_cacheFilePath {
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
}

+ (NSString *)ysy_temporaryFilePath {
    return NSTemporaryDirectory();
}

- (NSString *)ysy_appendDocumentDirectory {
    
    NSString *dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
}

- (NSString *)ysy_appendCacheDirectory {
    
    NSString *dir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
}

- (NSString *)ysy_appendTempDirectory {
    
    NSString *dir = NSTemporaryDirectory();
    
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
}

@end
