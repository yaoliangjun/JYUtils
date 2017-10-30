//
//  NSString+Extension.m
//  JYUtils
//
//  Created by Jerry Yao on 17/3/16.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "NSString+Extension.h"
#import "NSData+Extension.h"

@implementation NSString (Extension)

/**
 *  判断字符串是否为Nil或者空
 *  @return  YES:为nil或者空，NO:有内容
 */
- (BOOL)isEmpty
{
    if (self &&
        self != nil &&
        self != (id)[NSNull null] &&
        ![self isEqualToString:@""] &&
        ![self isEqualToString:@"<null>"] &&
        ![self isEqualToString:@"(null)"] &&
        ![self isEqualToString:@"null"]) {
        return NO;
    }
    
    return YES;
}

/**
 手机号是否合法
 */
- (BOOL)isValidPhoneNumber
{
    NSPredicate *postcodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[1][3,4,5,7,8][0-9]{9}$"];
    return [postcodeTest evaluateWithObject:self];
}

- (BOOL)isValieEmail
{
    NSPredicate *postcodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"];
    return [postcodeTest evaluateWithObject:self];
}

- (BOOL)isValieIDCard
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

- (BOOL)isValideBankCard
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
    return [self boundingRectWithSize:calculateSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
}

- (BOOL)judgePassWordLegal
{
    BOOL result = NO;
    // 判断长度大于8位后再接着判断是否同时包含数字和字符
    NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    result = [pred evaluateWithObject:self];
    return result;
}

- (NSString *)md5String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md5String];
}

@end
