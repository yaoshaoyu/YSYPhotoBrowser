//
//  NSDictionary+YSYLog.m
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/9.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "NSDictionary+YSYLog.h"


@implementation NSDictionary (YSYLog)

- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *stringM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [stringM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [stringM appendString:@"}\n"];
    
    return stringM;
}

@end
