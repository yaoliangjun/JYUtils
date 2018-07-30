//
//  UIButton+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 17/3/9.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIButton (Extension)

/**
 创建一个只有点击事件的按钮
 */
+ (UIButton *)buttonWithTarget:(id)target selector:(SEL)selector;

/**
 创建一个通用的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font target:(id)target selector:(SEL)selector;

/**
 创建一个有背景图片的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundImageName:(NSString *)backgroundImageName highlightedBackgroundImageName:(NSString *)highlightedBackgroundImageName target:(id)target selector:(SEL)selector;

/**
 创建一个有背景颜色的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor highlightedBackgroundColor:(UIColor *)highlightedBackgroundColor target:(id)target selector:(SEL)selector;

/**
 创建一个只有图片的按钮
 */
+ (UIButton *)buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName target:(id)target selector:(SEL)selector;

/**
 创建一个只有背景图片的按钮
 */
+ (UIButton *)buttonWithBackgroundImageName:(NSString *)backgroundImageName highlightedBackgroundImageName:(NSString *)highlightedBackgroundImageName target:(id)target selector:(SEL)selector;

/**
 创建一个有图片和背景图片的按钮
 */
+ (UIButton *)buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName backgroundImageName:(NSString *)backgroundImageName highlightedBackgroundImageName:(NSString *)highlightedBackgroundImageName target:(id)target selector:(SEL)selector;

/**
 创建一个有图片和背景颜色的按钮
 */
+ (UIButton *)buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName backgroundColor:(UIColor *)backgroundColor target:(id)target selector:(SEL)selector;

/**
 创建一个有图片和背景颜色的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName backgroundColor:(UIColor *)backgroundColor target:(id)target selector:(SEL)selector;

/**
 创建一个有边框、圆角和背景图片名字的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundImageName:(NSString *)backgroundImageName highlightedBackgroundImageName:(NSString *)highlightedBackgroundImageName borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius target:(id)target selector:(SEL)selector;

/**
 创建一个有边框、圆角和背景图片的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundImage:(UIImage *)backgroundImage highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius target:(id)target selector:(SEL)selector;

/**
 创建一个有边框、圆角和背景颜色的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor highlightedBackgroundColor:(UIColor *)highlightedBackgroundColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius target:(id)target selector:(SEL)selector;

/**
 创建一个有边框、圆角、图片和背景颜色的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName backgroundColor:(UIColor *)backgroundColor highlightedBackgroundColor:(UIColor *)highlightedBackgroundColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius target:(id)target selector:(SEL)selector;

@end

