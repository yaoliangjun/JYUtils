//
//  UIButton+Extension.m
//  JYUtils
//
//  Created by Jerry Yao on 17/3/9.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "UIButton+Extension.h"
#import "UIImage+Extension.m"

@implementation UIButton (Extension)

/**
 创建一个只有点击事件的按钮
 */
+ (UIButton *)buttonWithTarget:(id)target selector:(SEL)selector {
    UIButton *btn = [[self alloc] initWithFrame:CGRectZero];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

/**
 创建一个通用的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font target:(id)target selector:(SEL)selector
{
    UIButton *btn = [self buttonWithTarget:target selector:selector];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
    btn.titleLabel.font = font;
    return btn;
}

/**
 创建一个有背景图片的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundImageName:(NSString *)backgroundImageName highlightedBackgroundImageName:(NSString *)highlightedBackgroundImageName target:(id)target selector:(SEL)selector
{
    UIButton *btn = [self buttonWithTitle:title titleColor:titleColor highlightedTitleColor:highlightedTitleColor font:font target:target selector:selector];
    [btn setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highlightedBackgroundImageName] forState:UIControlStateHighlighted];
    return btn;
}

/**
 创建一个有背景颜色的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor highlightedBackgroundColor:(UIColor *)highlightedBackgroundColor target:(id)target selector:(SEL)selector
{
    UIButton *btn = [self buttonWithTitle:title titleColor:titleColor highlightedTitleColor:highlightedTitleColor font:font target:target selector:selector];
    [btn setBackgroundImage:[UIImage imageWithColor:backgroundColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:highlightedBackgroundColor] forState:UIControlStateHighlighted];
    return btn;
}

/**
 创建一个只有图片的按钮
 */
+ (UIButton *)buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName target:(id)target selector:(SEL)selector
{
    UIButton *imageBtn = [[self alloc] initWithFrame:CGRectZero];
    [imageBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [imageBtn setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [imageBtn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return imageBtn;
}

/**
 创建一个只有背景图片的按钮
 */
+ (UIButton *)buttonWithBackgroundImageName:(NSString *)backgroundImageName highlightedBackgroundImageName:(NSString *)highlightedBackgroundImageName target:(id)target selector:(SEL)selector
{
    UIButton *imageBtn = [[self alloc] initWithFrame:CGRectZero];
    [imageBtn setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    [imageBtn setBackgroundImage:[UIImage imageNamed:highlightedBackgroundImageName] forState:UIControlStateHighlighted];
    return imageBtn;
}

/**
 创建一个有图片和背景图片的按钮
 */
+ (UIButton *)buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName backgroundImageName:(NSString *)backgroundImageName highlightedBackgroundImageName:(NSString *)highlightedBackgroundImageName target:(id)target selector:(SEL)selector
{
    UIButton *imageBtn = [self buttonWithImageName:imageName highlightedImageName:highlightedImageName target:target selector:selector];
    [imageBtn setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    [imageBtn setBackgroundImage:[UIImage imageNamed:highlightedBackgroundImageName] forState:UIControlStateHighlighted];
    return imageBtn;
}

/**
 创建一个有图片和背景颜色的按钮
 */
+ (UIButton *)buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName backgroundColor:(UIColor *)backgroundColor target:(id)target selector:(SEL)selector
{
    UIButton *imageBtn = [self buttonWithImageName:imageName highlightedImageName:highlightedImageName target:target selector:selector];
    [imageBtn setBackgroundColor:backgroundColor];
    return imageBtn;
}

/**
 创建一个有图片和背景颜色的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName backgroundColor:(UIColor *)backgroundColor target:(id)target selector:(SEL)selector
{
    UIButton *btn = [UIButton buttonWithImageName:imageName highlightedImageName:highlightedImageName backgroundColor:backgroundColor target:target selector:selector];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    return btn;
}

/**
 创建一个有边框、圆角和背景图片名字的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundImageName:(NSString *)backgroundImageName highlightedBackgroundImageName:(NSString *)highlightedBackgroundImageName borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius target:(id)target selector:(SEL)selector
{
    UIButton *btn = [self buttonWithTitle:title titleColor:titleColor highlightedTitleColor:highlightedTitleColor font:font backgroundImageName:backgroundImageName highlightedBackgroundImageName:highlightedBackgroundImageName target:target selector:selector];
    btn.layer.borderWidth = borderWidth;
    btn.layer.cornerRadius = cornerRadius;
    btn.clipsToBounds = YES;
    if (borderColor != nil) {
        btn.layer.borderColor = borderColor.CGColor;
    }
    return btn;
}

/**
 创建一个有边框、圆角和背景图片的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundImage:(UIImage *)backgroundImage highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius target:(id)target selector:(SEL)selector
{
    UIButton *btn = [self buttonWithTitle:title titleColor:titleColor highlightedTitleColor:highlightedTitleColor font:font target:target selector:selector];
    [btn setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [btn setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
    btn.layer.borderWidth = borderWidth;
    btn.layer.cornerRadius = cornerRadius;
    btn.layer.masksToBounds = YES;
    if (borderColor != nil) {
        btn.layer.borderColor = borderColor.CGColor;
    }
    return btn;
}

/**
 创建一个有边框、圆角和背景颜色的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor highlightedBackgroundColor:(UIColor *)highlightedBackgroundColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius target:(id)target selector:(SEL)selector
{
    UIButton *btn = [self buttonWithTitle:title titleColor:titleColor highlightedTitleColor:highlightedTitleColor font:font backgroundColor:backgroundColor highlightedBackgroundColor:highlightedBackgroundColor target:target selector:selector];
    btn.layer.borderWidth = borderWidth;
    btn.layer.cornerRadius = cornerRadius;
    btn.clipsToBounds = YES;
    if (borderColor != nil) {
        btn.layer.borderColor = borderColor.CGColor;
    }
    return btn;
}

/**
 创建一个有边框、圆角、图片和背景颜色的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName backgroundColor:(UIColor *)backgroundColor highlightedBackgroundColor:(UIColor *)highlightedBackgroundColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius target:(id)target selector:(SEL)selector
{
    UIButton *btn = [UIButton buttonWithTitle:title titleColor:titleColor highlightedTitleColor:highlightedTitleColor font:font backgroundColor:backgroundColor highlightedBackgroundColor:highlightedBackgroundColor borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius target:target selector:selector];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    
    return btn;
}

@end

