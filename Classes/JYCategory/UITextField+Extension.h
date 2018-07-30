//
//  UITextField+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 17/3/11.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

@interface UITextField (Extension)

/** 创建一个通用的UITextField */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font;

/** 创建一个UITextField(有leftView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font leftView:(UIView *)leftView;

/** 创建一个UITextField(有背景图片) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed;

/** 创建一个UITextField(有背景图片、leftView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView;

/** 创建一个UITextField(有背景图片、rightView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed rightView:(UIView *)rightView;

/** 创建一个UITextField(有背景图片、leftView、rightView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView rightView:(UIView *)rightView;

/** 创建一个UITextField(有背景图片、leftView、rightView和rightViewMode) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView rightView:(UIView *)rightView rightViewMode:(UITextFieldViewMode)rightViewMode;

/** 创建一个UITextField(有边框、边框颜色、圆角) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius;

/** 创建一个UITextField(有边框、边框颜色、圆角、leftView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView;

/** 创建一个UITextField(有边框、边框颜色、圆角、rightView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius rightView:(UIView *)rightView;

/** 创建一个UITextField(有边框、边框颜色、圆角、leftView、rightView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView rightView:(UIView *)rightView;

/** 创建一个UITextField(有背景颜色、圆角、leftView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor cornerRadius:(float)cornerRadius leftView:(UIView *)leftView;

/** 创建一个UITextField(有背景颜色、边框、边框颜色、圆角、leftView、rightView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView rightView:(UIView *)rightView;

/** 创建一个UITextField(有边框、边框颜色、圆角、leftView和leftViewMode、rightView和rightViewMode) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView leftViewMode:(UITextFieldViewMode)leftViewMode rightView:(UIView *)rightView rightViewMode:(UITextFieldViewMode)rightViewMode;

/** 创建一个UITextField(有leftView和rightView) */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font leftView:(UIView *)leftView  rightView:(UIView *)rightView;

@end

