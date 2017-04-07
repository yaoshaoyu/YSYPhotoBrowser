//
//  NSDate+YSYAddition.h
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/18.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (YSYAddition)

/**
 根据时间戳获取格式化字符串

 @param timestamp 时间戳
 @return 格式化字符串
 */
+ (NSString *)ysy_dateWithTimestamp:(NSString *)timestamp;

/**
 获取格式化字符串

 @param timestamp 时间戳
 @param dateFormat 日期格式
 @return 格式化字符串
 */
+ (NSString *)ysy_dateWithTimestamp:(NSString *)timestamp dateFormat:(NSString *)dateFormat;

/**
 获取年份

 @param timestamp 时间戳
 @return 年份
 */
+ (NSString *)ysy_yearWithTimestamp:(NSString *)timestamp;

/**
 获取月份

 @param timestamp 时间戳
 @return 月份
 */
+ (NSString *)ysy_monthWithTimestamp:(NSString *)timestamp;

/**
 获取日期

 @param timestamp 时间戳
 @return 日期
 */
+ (NSString *)ysy_dayWithTimestamp:(NSString *)timestamp;

/**
 * 判断是否是今年
 *
 *  @param target 代表需要与当前时间进行对比的NSdate对象
 *
 *  @return 结果
 */
+ (BOOL)ysy_isThisYearWithTarget:(NSDate *)target;

/**
 *  判断是否今天
 *
 *  @param target 代表需要与当前时间进行对比的NSdate对象
 *
 *  @return 结果
 */
+ (BOOL)ysy_isTodayWithTarget:(NSDate *)target;

/**
 *  判断是否是昨天
 *
 *  @param target 代表需要与当前时间进行对比的NSdate对象
 *
 *  @return 结果
 */
+ (BOOL)ysy_isYesterdayWithTarget:(NSDate *)target;

/**
 *  判断是否是昨天
 *
 *  @param target 代表需要与当前时间进行对比的NSdate对象
 *
 *  @return 结果
 */
+ (BOOL)ysy_isYesterdayWithTarget2:(NSDate *)target;

@end
