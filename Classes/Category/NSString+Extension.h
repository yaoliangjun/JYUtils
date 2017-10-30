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

/** 判断字符串是否为Nil或者空 */
- (BOOL)isEmpty;

/** 校验手机号是否合法 */
- (BOOL)isValidPhoneNumber;

/** 邮箱是否合法 */
- (BOOL)isValieEmail;

/** 身份证是否合法 */
- (BOOL)isValieIDCard;

/** 银行卡号是否合法 */
- (BOOL)isValideBankCard;

/** 过滤掉字符串中的html标签 */
+ (NSString *)filterHTML:(NSString *)html;

/** 处理HTML字符串，让图片和内容适应屏幕宽度 */
+ (NSString *)processHTMLString:(NSString *)htmlString;

/** 计算文字宽高 */
- (CGSize)calculateWithSize:(CGSize)calculateSize font:(UIFont *)font;\

/**
 判断用户输入的密码是否符合规范，符合规范的密码要求：
 密码中必须同时包含数字和字母
 */
- (BOOL)judgePassWordLegal;

/** MD5加密 */
- (NSString *)md5String;

@end
