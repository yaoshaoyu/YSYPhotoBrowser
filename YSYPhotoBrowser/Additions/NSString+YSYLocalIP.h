//
//  NSString+YSYLocalIP.h
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/2/7.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (YSYLocalIP)

/**
 获取本机ip
 
 @return 本机ip
 */
+ (NSString *)ysy_getLocalIPAddress;

/**
 获取本机ip
 
 @param preferIPv4 是否是ipv4
 @return 本机ip
 */
+ (NSString *)ysy_getLocalIPAddress:(BOOL)preferIPv4;

@end
