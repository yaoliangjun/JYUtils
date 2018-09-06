//
//  UIView+Extension.m
//  JYUtils
//
//  Created by Jerry.Yao on 15-11-20.
//  Copyright (c) 2015年 Jerry Yao. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

#pragma mark ---------------- Setters-----------------
- (void)setX:(CGFloat)x
{
    CGRect r        = self.frame;
    r.origin.x      = x;
    self.frame      = r;
}

- (void)setY:(CGFloat)y
{
    CGRect r        = self.frame;
    r.origin.y      = y;
    self.frame      = r;
}

- (void)setWidth:(CGFloat)width
{
    CGRect r        = self.frame;
    r.size.width    = width;
    self.frame      = r;
}

- (void)setHeight:(CGFloat)height
{
    CGRect r        = self.frame;
    r.size.height   = height;
    self.frame      = r;
}

- (void)setOrigin:(CGPoint)origin
{
    self.x          = origin.x;
    self.y          = origin.y;
}

- (void)setSize:(CGSize)size
{
    self.width      = size.width;
    self.height     = size.height;
}

- (void)setRight:(CGFloat)right
{
    NSAssert(self.superview != NULL, @"I have no super view!");
    CGRect frame = self.frame;
    frame.origin.x = self.superview.width - right - frame.size.width;
    self.frame = frame;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

#pragma mark ---------------- Getters-----------------
- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGPoint)origin
{
    return CGPointMake(self.x, self.y);
}

- (CGSize)size
{
    return CGSizeMake(self.width, self.height);
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

#pragma mark ---------------- other-----------------
/** 抖动 */
- (void) shake
{
    CAKeyframeAnimation *animationKey = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animationKey setDuration:0.5f];

    NSArray *array = [[NSArray alloc] initWithObjects:
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x-5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x+5, self.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                      nil];
    [animationKey setValues:array];

    NSArray *times = [[NSArray alloc] initWithObjects:
                      [NSNumber numberWithFloat:0.1f],
                      [NSNumber numberWithFloat:0.2f],
                      [NSNumber numberWithFloat:0.3f],
                      [NSNumber numberWithFloat:0.4f],
                      [NSNumber numberWithFloat:0.5f],
                      [NSNumber numberWithFloat:0.6f],
                      [NSNumber numberWithFloat:0.7f],
                      [NSNumber numberWithFloat:0.8f],
                      [NSNumber numberWithFloat:0.9f],
                      [NSNumber numberWithFloat:1.0f],
                      nil];
    [animationKey setKeyTimes:times];

    [self.layer addAnimation:animationKey forKey:@"TextFieldShake"];
}

/** 移除此view上的所有子视图 */
- (void)removeAllSubviews
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    return;
}

/** 创建一条分割线(有颜色) */
+ (UIView *)viewWithColor:(UIColor *)color
{
    UIView *lineView = [self lineWithFrame:CGRectZero color:color];
    return lineView;
}

/** 创建一条分割线(有Frame、颜色) */
+ (UIView *)lineWithFrame:(CGRect)frame color:(UIColor *)color
{
    UIView *lineView = [[self alloc] initWithFrame:frame];
    lineView.backgroundColor = color;
    return lineView;
}

@end
