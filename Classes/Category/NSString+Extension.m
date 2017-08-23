//
//  NSString+Extension.m
//  JYUtils
//
//  Created by Jerry Yao on 17/3/16.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


/**
 *  判断字符串是否为Nil或者空
 *
 *  @param str 需要校验的字符串
 *
 *  @return  YES:为nil或者空，NO:有内容
 */
+ (BOOL)isNilOrEmpty:(NSString *)str
{
    if (str &&
        str != nil &&
        str != (id)[NSNull null] &&
        ![str isEqualToString:@""] &&
        ![str isEqualToString:@"<null>"] &&
        ![str isEqualToString:@"(null)"] &&
        ![str isEqualToString:@"null"]) {
        return NO;
    }
    
    return YES;
}

/**
 *  计算文字宽高
 *
 *  @param size 要计算的宽高
 *  @param font 要计算的字体
 *
 *  @return 计算好的size
 */
- (CGSize)calculateWithSize:(CGSize)size andFont:(UIFont *)font
{
    return [(NSString *)self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
}


/**
 手机号是否合法
 
 @return <#return value description#>
 */
- (BOOL)isValidPhoneNumber
{
    NSPredicate *postcodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[1][3,4,5,7,8][0-9]{9}$"];
    return [postcodeTest evaluateWithObject:self];
}

@end
