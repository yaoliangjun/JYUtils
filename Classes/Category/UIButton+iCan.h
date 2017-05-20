//
//  UIButton+iCan.h
//  iCan
//
//  Created by Jerry Yao on 17/3/9.
//  Copyright © 2017年 LinkedTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (iCan)

/**
 创建一个不带圆角的文字按钮
 
 @param frame <#frame description#>
 @param title <#title description#>
 @param titleColor <#titleColor description#>
 @param font <#font description#>
 @param target <#target description#>
 @param selector <#selector description#>
 @return <#return value description#>
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target selector:(SEL)selector;

/**
 创建一个可以带圆角的文字按钮

 @param frame <#frame description#>
 @param title <#title description#>
 @param titleColor <#titleColor description#>
 @param font <#font description#>
 @param borderColor <#borderColor description#>
 @param borderWidth <#borderWidth description#>
 @param cornerRadius <#cornerRadius description#>
 @param target <#target description#>
 @param selector <#selector description#>
 @return <#return value description#>
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius target:(id)target selector:(SEL)selector;

/**
 创建一个带圆角被裁剪过的文字按钮，圆角位置可自定义
 
 @param frame <#frame description#>
 @param title <#title description#>
 @param titleColor <#titleColor description#>
 @param font <#font description#>
 @param borderColor <#borderColor description#>
 @param borderWidth <#borderWidth description#>
 @param cornerSize <#cornerSize description#>
 @param cornerPosition <#cornerPosition description#>
 @param target <#target description#>
 @param selector <#selector description#>
 @return <#return value description#>
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerSize:(CGSize)cornerSize cornerPosition:(UIRectCorner)cornerPosition target:(id)target selector:(SEL)selector;

/**
 创建一个只有图片的按钮
 
 @param frame 坐标
 @param image 默认图片
 @param highlightedImage 按下高亮图片
 @param target <#target description#>
 @param selector <#selector description#>
 @return <#return value description#>
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame image:(UIImage *)image highlightedImage:(UIImage *)highlightedImage target:(id)target selector:(SEL)selector;

/**
 创建一个只有背景图片的按钮
 
 @param frame 坐标
 @param backgroundImage 默认背景图片
 @param highlightedBackgroundImage 高亮背景图片
 @param target <#target description#>
 @param selector <#selector description#>
 @return <#return value description#>
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame backgroundImage:(UIImage *)backgroundImage highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage target:(id)target selector:(SEL)selector;

@end
