//
//  NSString+WTRegularExpression.m
//  IntelligentLinzi
//
//  Created by 吕成翘 on 17/3/1.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import "NSString+WTRegularExpression.h"


@implementation NSString (WTRegularExpression)

+ (BOOL)validatePassword:(NSString *)passWord {
    
    NSString *passWordRegex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    
    return [passWordPredicate evaluateWithObject:passWord];
}

@end
