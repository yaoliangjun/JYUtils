//
//  NSString+Extension.m
//  JYUtils
//
//  Created by Jerry Yao on 17/3/16.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "NSString+Extension.h"
#include <CommonCrypto/CommonCrypto.h>

@implementation NSString (Extension)

/**
 *  判断字符串是否为空
 *  @return  YES:为空，NO:不为空
 */
+ (BOOL)isEmpty:(NSString *)str {
    if (!str ||
        !str.length ||
        ![str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length ||
        [str isKindOfClass:[NSNull class]] ||
        [str isEqualToString:@"<null>"] ||
        [str isEqualToString:@"(null)"] ||
        [str isEqualToString:@"null"] ||
        [str isEqualToString:@"nil"]) {
        return YES;
    }
    
    return NO;
}

/**
 手机号是否合法
 */
- (BOOL)isValidPhoneNumber
{
    NSPredicate *postcodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[1][3,4,5,6,7,8,9][0-9]{9}$"];
    return [postcodeTest evaluateWithObject:self];
}

- (BOOL)isValidEmail
{
    NSPredicate *postcodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"];
    return [postcodeTest evaluateWithObject:self];
}

- (BOOL)isValidIDCard
{
    NSString *idCardStr;
    if (self.length == 15) {
        idCardStr = @"^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}[0-9Xx]$";
    } else if (self.length == 18) {
        idCardStr = @"^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$";
    }

    NSPredicate *postcodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"idCardStr"];
    return [postcodeTest evaluateWithObject:self];
}

- (BOOL)isValidBankCard
{
    if(self.length==0){
        return NO;
    }
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < self.length; i++){
        c = [self characterAtIndex:i];
        if (isdigit(c)){
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--){
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo){
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        }
        else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}

/** 过滤掉字符串中的html标签 */
+ (NSString *)filterHTML:(NSString *)html
{
    if (html == nil) {
        return nil;
    }

    NSScanner *scanner = [NSScanner scannerWithString:html];
    NSString *text = nil;
    while([scanner isAtEnd] == NO) {
        [scanner scanUpToString:@"<" intoString:nil];
        [scanner scanUpToString:@">" intoString:&text];
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@""];
    }

    html = [html stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"\n" withString:@""];

    return html;
}

/** 处理HTML字符串，让图片和内容适应屏幕宽度 */
+ (NSString *)processHTMLString:(NSString *)htmlString
{
    /**
     * _infoModel.content就是后台返回的带有html标签的字符串
     * " $img[p].style.width = '100%%';\n"--->就是设置图片的宽度的
     * 100%代表正好为屏幕的宽度
     */
    NSString *string = [NSString stringWithFormat:@"<html> \n"
                        "<head> \n"
                        "<style type=\"text/css\"> \n"
                        "body {font-size:15px;}\n"
                        "</style> \n"
                        "</head> \n"
                        "<body>"
                        "<script type='text/javascript'>"
                        "window.onload = function(){\n"
                        "var $img = document.getElementsByTagName('img');\n"
                        "for(var p in  $img){\n"
                        " $img[p].style.width = '100%%';\n"
                        "$img[p].style.height ='auto'\n"
                        "}\n"
                        "}"
                        "</script>%@"
                        "</body>"
                        "</html>", htmlString];

    return string;
}

- (CGSize)calculateWithSize:(CGSize)calculateSize font:(UIFont *)font
{
    return [self boundingRectWithSize:calculateSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName: font } context:nil].size;
}

/** 判断字符串是否同时包含数字和字符，并且在最小和最大长度范围内 */
- (BOOL)isValidAlphanumericWithMinLength:(NSInteger)minLength maxLength:(NSInteger)maxLength
{
    BOOL result = NO;
    NSString * regex = [NSString stringWithFormat:@"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{%ld,%ld}$", minLength, maxLength];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    result = [pred evaluateWithObject:self];
    return result;
}

/** MD5加密 */
- (NSString *)md5String {
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self dataUsingEncoding:NSUTF8StringEncoding].bytes, (CC_LONG)[self dataUsingEncoding:NSUTF8StringEncoding].length, result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (NSString *)currentLanguage
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSArray *allLanguages = [defaults objectForKey:@"AppleLanguages"];
    NSString *preferredLang = [allLanguages objectAtIndex:0];
    return preferredLang;
}

/** 是否是简体中文 */
+ (BOOL)isChineseSimplified
{
    NSString *language = [NSString currentLanguage];
    if ([language isEqualToString:@"zh-Hans"] ||     // iOS8
        [language isEqualToString:@"zh-Hans-US"] ||  // iOS9
        [language isEqualToString:@"zh-Hans-CN"]) {  // iOS10、11
        return YES;
    }
    return NO;
}

/** 是否是繁体中文(包含所有繁体) */
+ (BOOL)isChineseTraditional
{
    if ([self isTraditional] ||
        [self isChineseTraditionalHK] ||
        [self isChineseTraditionalTW] ||
        [self isChineseTraditionalMO]) {
        return YES;
    }
    return NO;
}

/** 是否是繁体中文(繁体中文) */
+ (BOOL)isTraditional
{
    NSString *language = [NSString currentLanguage];
    if ([language isEqualToString:@"zh-Hant"] ||     // iOS8
        [language isEqualToString:@"zh-Hant-US"] ||  // iOS9、10
        [language isEqualToString:@"zh-Hant-CN"]) {  // iOS11
        return YES;
    }
    return NO;
}

/** 是否是繁体香港 */
+ (BOOL)isChineseTraditionalHK
{
    NSString *language = [NSString currentLanguage];
    if ([language isEqualToString:@"zh-HK"] ||      // iOS8、9
        [language isEqualToString:@"zh-Hant-HK"]) { // iOS10、11
        return YES;
    }
    return NO;
}

/** 是否是繁体台湾 */
+ (BOOL)isChineseTraditionalTW
{
    NSString *language = [NSString currentLanguage];
    if ([language isEqualToString:@"zh-TW"] ||      // iOS8、9
        [language isEqualToString:@"zh-Hant-TW"]) { // iOS10、11
        return YES;
    }
    return NO;
}

/** 是否是繁体澳门 */
+ (BOOL)isChineseTraditionalMO
{
    NSString *language = [NSString currentLanguage];
    if ([language isEqualToString:@"zh-MO"] ||      // iOS8、9
        [language isEqualToString:@"zh-Hant-MO"]) { // iOS10、11
        return YES;
    }
    return NO;
}

/** 判断是否为整形 */
- (BOOL)isPureInt
{
    int val;
    NSScanner *scan = [NSScanner scannerWithString:self];
    return [scan scanInt:&val] && [scan isAtEnd];
}

/** 判断是否为浮点形 */
- (BOOL)isPureFloat
{
    float val;
    NSScanner *scan = [NSScanner scannerWithString:self];
    return [scan scanFloat:&val] && [scan isAtEnd];
}

/** 字符串保留小数点 */
- (NSString *)decimalPoint:(int)count
{
    if (!self.length || (![self isPureInt] && ![self isPureFloat])) {
        return @"0";
    }

    NSString *str = [NSString stringWithFormat:@"%%.%df", count];
    return [NSString stringWithFormat:str, [self doubleValue]];
}

/** 保留N为小数，不四舍五入 */
+ (NSString *)doubleValue:(double)doubleValue afterPoint:(int)position
{
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal = [[NSDecimalNumber alloc] initWithDouble:doubleValue];
    NSDecimalNumber *roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];

    return [NSString stringWithFormat:@"%@", roundedOunces];
}

@end

