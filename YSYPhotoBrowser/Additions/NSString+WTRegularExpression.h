//
//  NSString+WTRegularExpression.h
//  IntelligentLinzi
//
//  Created by 吕成翘 on 17/3/1.
//  Copyright © 2017年 Weitac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (WTRegularExpression)

/**
 利用正则表达式判断密码是否是由数字和字母组成的6-20位字符串

 @param passWord 密码
 @return 是否符合条件
 */
+ (BOOL)validatePassword:(NSString *)passWord;

@end
