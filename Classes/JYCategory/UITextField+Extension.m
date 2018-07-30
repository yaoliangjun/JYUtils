//
//  UITextField+Extension.m
//  JYUtils
//
//  Created by Jerry Yao on 17/3/11.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)

/** 创建一个通用的UITextField */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font
{
    UITextField *textField = [[self alloc] init];
    textField.text = text;
    textField.textColor = textColor;
    textField.font = font;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    if (placeHolder != nil) {
        textField.placeholder = placeHolder;
    }

    if (placeHolderColor != nil) {
        [textField setValue:placeHolderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    return textField;
}

/** 创建一个UITextField(有leftView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font leftView:(UIView *)leftView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font];
    if (leftView != nil) {
        textField.leftView = leftView;
        textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return textField;
}

/** 创建一个UITextField(有背景图片) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font];
    textField.background = [UIImage imageNamed:backgroundImageNamed];
    return textField;
}

/** 创建一个UITextField(有背景图片、leftView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundImageNamed:backgroundImageNamed];
    if (leftView != nil) {
        textField.leftView = leftView;
        textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return textField;
}

/** 创建一个UITextField(有背景图片、rightView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed rightView:(UIView *)rightView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundImageNamed:backgroundImageNamed];
    if (rightView != nil) {
        textField.rightView = rightView;
        textField.rightViewMode = UITextFieldViewModeAlways;
    }
    return textField;
}

/** 创建一个UITextField(有背景图片、leftView、rightView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView rightView:(UIView *)rightView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundImageNamed:backgroundImageNamed rightView:rightView];
    if (leftView != nil) {
        textField.leftView = leftView;
        textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return textField;
}

/** 创建一个UITextField(有背景图片、leftView、rightView和rightViewMode) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView rightView:(UIView *)rightView rightViewMode:(UITextFieldViewMode)rightViewMode
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundImageNamed:backgroundImageNamed leftView:leftView];
    if (rightView != nil) {
        textField.rightView = rightView;
        textField.rightViewMode = rightViewMode;
    }
    return textField;
}

/** 创建一个UITextField(有边框、边框颜色、圆角) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font];
    textField.layer.borderColor = borderColor.CGColor;
    textField.layer.borderWidth = borderWidth;
    textField.layer.cornerRadius = cornerRadius;
    return textField;
}

/** 创建一个UITextField(有边框、边框颜色、圆角、leftView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius];
    if (leftView != nil) {
        textField.leftView = leftView;
        textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return textField;
}

/** 创建一个UITextField(有边框、边框颜色、圆角、rightView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius rightView:(UIView *)rightView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius];
    if (rightView != nil) {
        textField.rightView = rightView;
        textField.rightViewMode = UITextFieldViewModeAlways;
    }
    return textField;
}

/** 创建一个UITextField(有边框、边框颜色、圆角、leftView、rightView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView rightView:(UIView *)rightView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius leftView:leftView];
    if (rightView != nil) {
        textField.rightView = rightView;
        textField.rightViewMode = UITextFieldViewModeAlways;
    }
    return textField;
}

/** 创建一个UITextField(有背景颜色、圆角、leftView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor cornerRadius:(float)cornerRadius leftView:(UIView *)leftView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font borderColor:nil borderWidth:0 cornerRadius:cornerRadius];
    textField.backgroundColor = backgroundColor;
    if (leftView != nil) {
        textField.leftView = leftView;
        textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return textField;
}

/** 创建一个UITextField(有背景颜色、边框、边框颜色、圆角、leftView、rightView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView rightView:(UIView *)rightView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius leftView:leftView rightView:rightView];
    textField.backgroundColor = backgroundColor;
    return textField;
}

/** 创建一个UITextField(有边框、边框颜色、圆角、leftView和leftViewMode、rightView和rightViewMode) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView leftViewMode:(UITextFieldViewMode)leftViewMode rightView:(UIView *)rightView rightViewMode:(UITextFieldViewMode)rightViewMode
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius];
    if (leftView != nil) {
        textField.leftView = leftView;
        textField.leftViewMode = leftViewMode;
    }

    if (rightView != nil) {
        textField.rightView = rightView;
        textField.rightViewMode = rightViewMode;
    }
    return textField;
}

/** 创建一个UITextField(有leftView和rightView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font leftView:(UIView *)leftView  rightView:(UIView *)rightView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font];
    if (leftView != nil) {
        textField.leftView = leftView;
        textField.leftViewMode = UITextFieldViewModeAlways;
    }
    
    if (rightView != nil) {
        textField.rightView = rightView;
        textField.rightViewMode = UITextFieldViewModeAlways;
    }
    
    return textField;
}

@end

