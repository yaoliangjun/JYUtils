//
//  UILabel+Extension.m
//  JYUtils
//
//  Created by Jerry Yao on 17/3/8.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

/**
 创建一个UILabel
 
 @param frame 坐标大小
 @param text 显示的文字
 @param font 字体
 @return UILabel
 */
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = font;
    return label;
}

/**
 创建一个UILabel
 
 @param frame 坐标大小
 @param text 显示的文字
 @param textColor 文字颜色
 @param font 字体
 @return UILabel
 */
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font
{
    UILabel *label = [self labelWithFrame:frame text:text font:font];
    label.textColor = textColor;
    return label;
}

+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *) textColor font:(UIFont *)font
{
    UILabel *label = [[self alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    
    return label;
}

- (CGFloat)labelWidth
{
    NSDictionary *attribute = @{ NSFontAttributeName:self.font };
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.frame.size.height)
                                          options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                       attributes:attribute
                                          context:nil].size;
    return size.width;
}

- (CGFloat)labelHeight
{
    NSDictionary *attribute = @{NSFontAttributeName:self.font};
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                       attributes:attribute context:nil].size;
    return size.height;
}

@end
