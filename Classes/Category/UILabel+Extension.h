//
//  UILabel+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 17/3/8.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//  UILabel创建公用方法

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/**
 创建一个有Frame默认字体颜色的UILabel
 
 @param frame 坐标大小
 @param text 显示的文字
 @param font 字体
 @return UILabel
 */
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font;

/**
 创建一个有Frame的UILabel
 
 @param frame 坐标大小
 @param text 显示的文字
 @param textColor 文字颜色
 @param font 字体
 @return UILabel
 */
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;

/** 创建一个有文字、颜色和字体的UILabel */
+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *) textColor font:(UIFont *)font;

/** 获取UILabel的宽度 */
- (CGFloat)labelWidth;

/** 获取UILabel的高度 */
- (CGFloat)labelHeight;

@end
