//
//  NSArray+YSYLog.m
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/9.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "NSArray+YSYLog.h"


@implementation NSArray (YSYLog)

- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *stringM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [stringM appendFormat:@"\t%@,\n", obj];
    }];
    
    [stringM appendString:@")"];
    
    return stringM;
}

@end
