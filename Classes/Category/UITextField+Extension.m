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
 *  创建一个普通的UITextField
 */
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

/**
 *  创建一个有背景图片的TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font];
    textField.background = [UIImage imageNamed:backgroundImageNamed];
    
    return textField;
}

/**
 *  创建一个有背景图片、leftView的TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundImageNamed:backgroundImageNamed];
    
    if (leftView != nil) {
        textField.leftView = leftView;
        textField.leftViewMode = UITextFieldViewModeAlways;
    }
    
    return textField;
}

/**
 *  创建一个有背景图片、rightView的TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed rightView:(UIView *)rightView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundImageNamed:backgroundImageNamed];
    
    if (rightView != nil) {
        textField.rightView = rightView;
        textField.rightViewMode = UITextFieldViewModeAlways;
    }
    
    return textField;
}

/**
 *  创建一个有背景图片、leftView和rightView的UITextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView rightView:(UIView *)rightView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundImageNamed:backgroundImageNamed];
    
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

/**
 *  创建一个有背景图片、leftView、rightView和rightViewMode的UITextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView rightView:(UIView *)rightView rightViewMode:(UITextFieldViewMode)rightViewMode
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundImageNamed:backgroundImageNamed];
    
    if (leftView != nil) {
        textField.leftView = leftView;
        textField.leftViewMode = UITextFieldViewModeAlways;
    }
    
    if (rightView != nil) {
        textField.rightView = rightView;
        textField.rightViewMode = rightViewMode;
    }
    
    return textField;
}

/**
 *  创建一个有边框、圆角的UITextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font];
    textField.layer.borderColor = borderColor.CGColor;
    textField.layer.borderWidth = borderWidth;
    textField.layer.cornerRadius = cornerRadius;
    
    return textField;
}

/**
 *  创建一个有边框、圆角和leftView的UITextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius];
    
    if (leftView != nil) {
        textField.leftView = leftView;
        textField.leftViewMode = UITextFieldViewModeAlways;
    }
    
    return textField;
}

/**
 *  创建一个有边框、圆角和rightView的UITextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius rightView:(UIView *)rightView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius];
    
    if (rightView != nil) {
        textField.rightView = rightView;
        textField.rightViewMode = UITextFieldViewModeAlways;
    }
    
    return textField;
}

/**
 *  创建一个有边框、圆角、leftView和rightView的UITextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView rightView:(UIView *)rightView
{
    UITextField *textField = [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius];
    
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
