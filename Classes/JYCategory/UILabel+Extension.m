//
//  UILabel+Extension.m
//  JYUtils
//
//  Created by Jerry Yao on 17/3/8.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

/** 创建一个UILabel(有文字、字体) */
+ (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = font;
    return label;
}

/** 创建一个UILabel(有文字、颜色、字体) */
+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *) textColor font:(UIFont *)font
{
    UILabel *label = [self labelWithFrame:CGRectZero text:text textColor:textColor font:font];
    return label;
}

/** 创建一个UILabel(有文字、颜色、字体、行数) */
+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *) textColor font:(UIFont *)font numberOfLines:(NSInteger)numberOfLines
{
    UILabel *label = [self labelWithFrame:CGRectZero text:text textColor:textColor font:font];
    label.numberOfLines = numberOfLines;
    return label;
}

/** 创建一个UILabel(有文字、对齐方式、颜色、字体、行数) */
+ (UILabel *)labelWithText:(NSString *)text textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)textColor font:(UIFont *)font numberOfLines:(NSInteger)numberOfLines {
    UILabel *label = [self labelWithText:text textColor:textColor font:font numberOfLines:numberOfLines];
    label.textAlignment = textAlignment;
    return label;
}

/** 创建一个UILabel(有文字、对齐方式、颜色、字体) */
+ (UILabel *)labelWithText:(NSString *)text textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *) textColor font:(UIFont *)font
{
    UILabel *label = [self labelWithText:text textColor:textColor font:font];
    label.textAlignment = textAlignment;
    return label;
}

/** 创建一个UILabel(有Frame、文字、字体) */
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font
{
    UILabel *label = [self labelWithText:text font:font];
    label.frame = frame;
    return label;
}

/** 创建一个UILabel(有Frame、文字、颜色、字体) */
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font
{
    UILabel *label = [self labelWithFrame:frame text:text font:font];
    label.textColor = textColor;
    return label;
}

/** 创建一个UILabel(有Frame、文字、对齐方式、颜色、字体) */
+ (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)textColor font:(UIFont *)font
{
    UILabel *label = [self labelWithFrame:frame text:text textColor:textColor font:font];
    label.textAlignment = textAlignment;
    return label;
}

/** 获取UILabel的宽度 */
- (CGFloat)labelWidth
{
    NSDictionary *attribute = @{ NSFontAttributeName: self.font };
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.frame.size.height)
                                          options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       attributes:attribute
                                          context:nil].size;
    return size.width;
}

/** 获取UILabel的高度 */
- (CGFloat)labelHeight
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       attributes:attribute context:nil].size;
    return size.height;
}

/* 设置段落间距和行间距 */
- (void)setParagraphSpacing:(CGFloat)paragraphSpacing lineSpacing:(CGFloat)lineSpacing {
    NSString *text = self.text;
    if (text == nil || !text.length) {
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    ;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setParagraphSpacing:paragraphSpacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    self.attributedText = attributedString;
}

@end
