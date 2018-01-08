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
- (BOOL)isEmpty;

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

@end
