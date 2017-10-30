//
//  UITextField+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 17/3/11.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

@interface UITextField (Extension)

/**
 *  创建一个普通的UITextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font;
/**
 *  创建一个有背景图片的TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed;

/**
 *  创建一个有背景图片、leftView的TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView;

/**
 *  创建一个有背景图片、rightView的TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed rightView:(UIView *)rightView;

/**
 *  创建一个有背景图片、leftView和rightView的TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView rightView:(UIView *)rightView;

/**
 *  创建一个有背景图片、leftView、rightView和rightViewMode的UITextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView rightView:(UIView *)rightView rightViewMode:(UITextFieldViewMode)rightViewMode;

/**
 *  创建一个有边框、圆角的UITextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius;

/**
 *  创建一个有边框、圆角和leftView的UITextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView;

/**
 *  创建一个有边框、圆角和rightView的UITextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius rightView:(UIView *)rightView;

/**
 *  创建一个有边框、圆角、leftView和rightView的UITextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView rightView:(UIView *)rightView;

@end
