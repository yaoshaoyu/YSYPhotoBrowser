//
//  NSString+YSYBase64.h
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/9.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (YSYBase64)

/**
 对当前字符串进行 BASE 64 编码

 @return BASE 64 编码后的字符串
 */
- (NSString *)ysy_base64Encode;

/**
 对当前字符串进行 BASE 64 解码

 @return BASE 64 解码后的字符串
 */
- (NSString *)ysy_base64Decode;

@end
