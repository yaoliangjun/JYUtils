//
//  UIButton+iCan.m
//  iCan
//
//  Created by Jerry Yao on 17/3/9.
//  Copyright © 2017年 LinkedTech. All rights reserved.
//

#import "UIButton+iCan.h"

@implementation UIButton (iCan)

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
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target selector:(SEL)selector
{
    UIButton *btn = [[self alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    if (titleColor != nil) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    btn.titleLabel.font = font;
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    btn.clipsToBounds = YES;
    
    return btn;
}

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
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius target:(id)target selector:(SEL)selector
{
    UIButton *btn = [[self alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    
    if (titleColor != nil) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }

    if (borderColor != nil) {
        btn.layer.borderColor = borderColor.CGColor;
    }
    
    btn.layer.borderWidth = borderWidth;
    btn.layer.cornerRadius = cornerRadius;
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    btn.clipsToBounds = YES;
    
    return btn;
}


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
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerSize:(CGSize)cornerSize cornerPosition:(UIRectCorner)cornerPosition target:(id)target selector:(SEL)selector
{
    UIButton *btn = [self buttonWithFrame:frame title:title titleColor:titleColor font:font borderColor:borderColor borderWidth:borderWidth cornerRadius:0 target:target selector:selector];
    
    // 获取一条曲线
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:btn.bounds byRoundingCorners:cornerPosition cornerRadii:cornerSize];
    // 初始化一个CAShapeLayer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = btn.bounds;
    // 将曲线路径设置为layer的路径
    maskLayer.path = path.CGPath;
    // 设置控件的mask为CAShapeLayer
    btn.layer.mask = maskLayer;
    
    return btn;
}


/**
 创建一个只有图片的按钮

 @param frame 坐标
 @param image 默认图片
 @param highlightedImage 按下高亮图片
 @param target <#target description#>
 @param selector <#selector description#>
 @return <#return value description#>
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame image:(UIImage *)image highlightedImage:(UIImage *)highlightedImage target:(id)target selector:(SEL)selector
{
    UIButton *imageBtn = [[UIButton alloc] initWithFrame:frame];
    [imageBtn setImage:image forState:UIControlStateNormal];
    [imageBtn setImage:highlightedImage forState:UIControlStateHighlighted];
    [imageBtn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return imageBtn;
}

/**
 创建一个只有背景图片的按钮
 
 @param frame 坐标
 @param backgroundImage 默认背景图片
 @param highlightedBackgroundImage 高亮背景图片
 @param target <#target description#>
 @param selector <#selector description#>
 @return <#return value description#>
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame backgroundImage:(UIImage *)backgroundImage highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage target:(id)target selector:(SEL)selector
{
    UIButton *imageBtn = [[UIButton alloc] initWithFrame:frame];
    [imageBtn setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [imageBtn setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
    [imageBtn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return imageBtn;
}

@end
