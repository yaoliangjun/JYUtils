//
//  NSString+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 17/3/16.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

/** 判断字符串是否为空 */
+ (BOOL)isEmpty:(NSString *)str;

/** 校验手机号是否合法 */
- (BOOL)isValidPhoneNumber;

/** 邮箱是否合法 */
- (BOOL)isValidEmail;

/** 身份证是否合法 */
- (BOOL)isValidIDCard;

/** 银行卡号是否合法 */
- (BOOL)isValidBankCard;

/** 过滤掉字符串中的html标签 */
+ (NSString *)filterHTML:(NSString *)html;

/** 处理HTML字符串，让图片和内容适应屏幕宽度 */
+ (NSString *)processHTMLString:(NSString *)htmlString;

/** 计算文字宽高 */
- (CGSize)calculateWithSize:(CGSize)calculateSize font:(UIFont *)font;

/** 判断字符串是否同时包含数字和字符，并且在最小和最大长度范围内 */
- (BOOL)isValidAlphanumericWithMinLength:(NSInteger)minLength maxLength:(NSInteger)maxLength;

/** MD5加密 */
- (NSString *)md5String;

/** 获取系统当前语言 */
+ (NSString *)currentLanguage;

/** 是否是简体中文 */
+ (BOOL)isChineseSimplified;

/** 是否是繁体中文(包含所有繁体) */
+ (BOOL)isChineseTraditional;

/** 是否是繁体中文 */
+ (BOOL)isTraditional;

/** 是否是繁体香港 */
+ (BOOL)isChineseTraditionalHK;

/** 是否是繁体台湾 */
+ (BOOL)isChineseTraditionalTW;

/** 是否是繁体澳门 */
+ (BOOL)isChineseTraditionalMO;

/** 判断是否为整形 */
- (BOOL)isPureInt;

/** 判断是否为浮点形 */
- (BOOL)isPureFloat;

/** 字符串保留小数点 */
- (NSString *)decimalPoint:(int)count;

/** 保留N为小数，不四舍五入 */
+ (NSString *)doubleValue:(double)doubleValue afterPoint:(int)position;

@end

