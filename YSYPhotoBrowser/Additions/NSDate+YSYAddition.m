//
//  NSDate+YSYAddition.m
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/18.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "NSDate+YSYAddition.h"


@implementation NSDate (YSYAddition)

+ (NSString *)ysy_dateWithTimestamp:(NSString *)timestamp {
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"EEE MMM dwd HH:mm:ss z yyyy";
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    NSDate *createDate = [NSDate dateWithTimeIntervalSince1970:timestamp.doubleValue];
    NSDate *currentDate = [NSDate date];
    
    // 是否是今年
    if ([NSDate ysy_isThisYearWithTarget:createDate]) {
        
        // 是否是今天
        if ([NSDate ysy_isTodayWithTarget:createDate]) {
            
            NSDate *result = [createDate dateByAddingTimeInterval:60];
            
            // 是否是一分钟之内
            if ([result compare:currentDate] == NSOrderedDescending) {
                
                return @"刚刚";
            }else{
                
                result = [createDate dateByAddingTimeInterval:3600];
                
                NSTimeInterval interval = [currentDate timeIntervalSinceDate:createDate];
                
                // 是否是一小时之内
                if ([result compare:currentDate] == NSOrderedDescending) {
                    
                    NSInteger result = interval / 60;
                    
                    return [NSString stringWithFormat:@"%zd分钟前",result];
                }else{
                    
                    NSInteger result = interval / 3600;
                    
                    return [NSString stringWithFormat:@"%zd小时前",result];
                }
            }
        }else{
            
            // 是否是昨天
            if([NSDate ysy_isYesterdayWithTarget2:createDate]){
                
                formatter.dateFormat = @"昨天 HH:mm";
                
                return [formatter stringFromDate:createDate];
            }else{
                
                formatter.dateFormat = @"MM-dd HH:mm";
                
                return [formatter stringFromDate:createDate];
            }
        }
    }else{
        
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        
        return [formatter stringFromDate:createDate];
    }
    
    return timestamp;
}

+ (NSString *)ysy_dateWithTimestamp:(NSString *)timestamp dateFormat:(NSString *)dateFormat {
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = dateFormat;
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    NSDate *createDate = [NSDate dateWithTimeIntervalSince1970:timestamp.doubleValue];
    NSString *createDateString = [formatter stringFromDate:createDate];
    
    return createDateString;
}

+ (NSString *)ysy_yearWithTimestamp:(NSString *)timestamp {
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy";
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    NSDate *createDate = [NSDate dateWithTimeIntervalSince1970:timestamp.doubleValue];
    NSString *createYear = [formatter stringFromDate:createDate];
    
    return createYear;
}

+ (NSString *)ysy_monthWithTimestamp:(NSString *)timestamp {
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"MM";
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    NSDate *createDate = [NSDate dateWithTimeIntervalSince1970:timestamp.doubleValue];
    NSString *createMonth = [formatter stringFromDate:createDate];
    
    return createMonth;
}

+ (NSString *)ysy_dayWithTimestamp:(NSString *)timestamp {
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"dd";
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    NSDate *createDate = [NSDate dateWithTimeIntervalSince1970:timestamp.doubleValue];
    NSString *createDay = [formatter stringFromDate:createDate];
    
    return createDay;
}


+ (BOOL)ysy_isThisYearWithTarget:(NSDate *)target{
    
    //取到当前时间
    NSDate *currentDate = [NSDate date];
    
    //初始化一个只提取年份的格式化器
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy";
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    //取出两个时间的年份的字符串
    NSString *currentYear = [formatter stringFromDate:currentDate];
    NSString *targetYear = [formatter stringFromDate:target];
    
    return [currentYear isEqualToString:targetYear];
}

+ (BOOL)ysy_isTodayWithTarget:(NSDate *)target{
    
    //取到当前时间
    NSDate *currentDate = [NSDate date];
    
    //初始化一个只提取年份的格式化器
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    //取出两个时间的年月日的字符串
    NSString *currentResult = [formatter stringFromDate:currentDate];
    NSString *targetResult = [formatter stringFromDate:target];
    
    //对比两个字符串是否一样
    return [currentResult isEqualToString:targetResult];
}

+ (BOOL)ysy_isYesterdayWithTarget:(NSDate *)target{
    
    //取到当前时间
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    //先转成string
    NSString *createStr = [formatter stringFromDate:target];
    NSString *currentStr = [formatter stringFromDate:currentDate];
    
    NSDate *createD = [formatter dateFromString:createStr];
    NSDate *currentD = [formatter dateFromString:currentStr];
    
    return ([currentD timeIntervalSinceDate:createD] == 3600 * 24);
}

+ (BOOL)ysy_isYesterdayWithTarget2:(NSDate *)target{
    
    //取到当前时间
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    
    //先转成string
    NSString *createStr = [formatter stringFromDate:target];
    NSString *currentStr = [formatter stringFromDate:currentDate];
    
    NSDate *createD = [formatter dateFromString:createStr];
    NSDate *currentD = [formatter dateFromString:currentStr];
    
    //取出当前日历对象
    NSCalendar *canlendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [canlendar components:NSCalendarUnitDay fromDate:createD toDate:currentD options:0];
    
    return components.day == 1;
}

@end
