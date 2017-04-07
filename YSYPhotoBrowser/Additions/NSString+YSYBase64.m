//
//  NSString+YSYBase64.m
//  AdditionsDemo
//
//  Created by 吕成翘 on 17/1/9.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "NSString+YSYBase64.h"


@implementation NSString (YSYBase64)

- (NSString *)ysy_base64Encode {
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)ysy_base64Decode {
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
