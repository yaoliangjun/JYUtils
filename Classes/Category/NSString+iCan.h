//
//  NSString+iCan.h
//  iCan
//
//  Created by Jerry Yao on 17/3/16.
//  Copyright © 2017年 LinkedTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (iCan)

/**
 *  判断字符串是否为Nil或者空
 *
 *  @param str 需要校验的字符串
 *
 *  @return  YES:为nil或者空，NO:有内容
 */
+ (BOOL)isNilOrEmpty:(NSString *)str;

/**
 *  计算文字宽高
 *
 *  @param size 要计算的宽高
 *  @param font 要计算的字体
 *
 *  @return 计算好的size
 */
- (CGSize)calculateWithSize:(CGSize)size andFont:(UIFont *)font;

/**
 手机号是否合法
 
 @return <#return value description#>
 */
- (BOOL)isValidPhoneNumber;

@end
