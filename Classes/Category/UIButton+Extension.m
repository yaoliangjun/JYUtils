//
//  UIButton+Extension.m
//  JYUtils
//
//  Created by Jerry Yao on 17/3/9.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

/**
 创建一个普通的文字按钮
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font target:(id)target selector:(SEL)selector
{
    UIButton *btn = [[self alloc] initWithFrame:CGRectZero];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
    btn.titleLabel.font = font;
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
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
 创建一个只有图片和背景图片的按钮
 */
+ (UIButton *)buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName backgroundImageName:(NSString *)backgroundImageName highlightedBackgroundImageName:(NSString *)highlightedBackgroundImageName target:(id)target selector:(SEL)selector
{
    UIButton *imageBtn = [self buttonWithImageName:imageName highlightedImageName:highlightedImageName target:self selector:selector];
    [imageBtn setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    [imageBtn setBackgroundImage:[UIImage imageNamed:highlightedBackgroundImageName] forState:UIControlStateHighlighted];
    
    return imageBtn;
}

/**
 创建一个只有图片和背景颜色的按钮
 */
+ (UIButton *)buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName backgroundColor:(UIColor *)backgroundColor target:(id)target selector:(SEL)selector
{
    UIButton *imageBtn = [self buttonWithImageName:imageName highlightedImageName:highlightedImageName target:self selector:selector];
    [imageBtn setBackgroundColor:backgroundColor];
    
    return imageBtn;
}

/**
 创建一个有边框、圆角和背景图片的文字按钮
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

@end
