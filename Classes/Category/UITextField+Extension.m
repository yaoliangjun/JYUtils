//
//  UITextField+Extension.m
//  JYUtils
//
//  Created by Jerry Yao on 17/3/11.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)

/**
 创建一个不带边框的UITextField
 
 @param frame 坐标
 @param placeholder placeholder
 @param font 字体
 @param textColor 文字颜色
 @return UITextField
 */
+ (UITextField *)textFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font
{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.text = text;
    textField.textColor = textColor;
    textField.font = font;
    placeholder = placeholder.length ? placeholder : @"";
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    return textField;
}

/**
 创建一个可以带边框的UITextField
 
 @param frame 坐标
 @param placeholder placeholder
 @param font 字体
 @param textColor 文字颜色
 @param borderColor 边框颜色
 @param borderWidth 边框宽度
 @param cornerRadius 圆角
 @return UITextField
 */
+ (UITextField *)textFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder font:(UIFont *)font textColor:(UIColor *)textColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius
{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.textColor = textColor;
    textField.font = font;
    placeholder = placeholder.length ? placeholder : @"";
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName : [UIColor whiteColor]}];
    textField.layer.borderColor = borderColor.CGColor;
    textField.layer.borderWidth = borderWidth;
    textField.layer.cornerRadius = cornerRadius;
    
    return textField;
}


/**
 创建一个可以带边框的UITextField，可以设置placeholderColor
 
 @param frame 坐标
 @param placeholder placeholder
 @param placeholderColor placeholderColor
 @param font 字体
 @param textColor 文字颜色
 @param borderColor 边框颜色
 @param borderWidth 边框宽度
 @param cornerRadius 圆角
 @return UITextField
 */
+ (UITextField *)textFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder placeholderColor:(UIColor *)placeholderColor font:(UIFont *)font textColor:(UIColor *)textColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius
{
    UITextField *textField = [self textFieldWithFrame:frame placeholder:placeholder font:font textColor:textColor borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName : placeholderColor}];
    
    return textField;
}

@end
