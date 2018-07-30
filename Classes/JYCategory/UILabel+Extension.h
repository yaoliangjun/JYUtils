//
//  UILabel+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 17/3/8.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//  UILabel创建公用方法

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/** 创建一个UILabel(有文字、字体) */
+ (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font;

/** 创建一个UILabel(有文字、颜色、字体) */
+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *) textColor font:(UIFont *)font;

/** 创建一个UILabel(有文字、颜色、字体、行数) */
+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *) textColor font:(UIFont *)font numberOfLines:(NSInteger)numberOfLines;

/** 创建一个UILabel(有文字、对齐方式、颜色、字体、行数) */
+ (UILabel *)labelWithText:(NSString *)text textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *) textColor font:(UIFont *)font numberOfLines:(NSInteger)numberOfLines;

/** 创建一个UILabel(有文字、对齐方式、颜色、字体) */
+ (UILabel *)labelWithText:(NSString *)text textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *) textColor font:(UIFont *)font;

/** 创建一个UILabel(有Frame、文字、字体) */
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font;

/** 创建一个UILabel(有Frame、文字、颜色、字体) */
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;

/** 创建一个UILabel(有Frame、文字、对齐方式、颜色、字体) */
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)textColor font:(UIFont *)font;

/** 获取UILabel的宽度 */
- (CGFloat)labelWidth;

/** 获取UILabel的高度 */
- (CGFloat)labelHeight;

/* 设置段落间距和行间距 */
- (void)setParagraphSpacing:(CGFloat)paragraphSpacing lineSpacing:(CGFloat)lineSpacing;

@end
