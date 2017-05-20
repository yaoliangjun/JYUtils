//
//  UIView+Yao.m
//
//  Created by Jerry.Yao on 15-11-20.
//  Copyright (c) 2015年 Jerry Yao. All rights reserved.
//

#import "UIView+Yao.h"

@implementation UIView (Yao)

@dynamic x;
@dynamic y;
@dynamic width;
@dynamic height;
@dynamic origin;
@dynamic size;

/**
 * @brief 抖动
 */
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
    //    [array release];
    
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
    //    [times release];
    
    [self.layer addAnimation:animationKey forKey:@"TextFieldShake"];
}

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
    //    CGRect frame = self.frame;
    //    frame.origin.x = right - frame.size.width;
    //    self.frame = frame;
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

- (UIView *)lastSubviewOnX
{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];
        
        for(UIView *v in self.subviews)
            if(v.x > outView.x)
                outView = v;
        
        return outView;
    }
    
    return nil;
}

- (UIView *)lastSubviewOnY
{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];
        
        for(UIView *v in self.subviews)
            if(v.y > outView.y)
                outView = v;
        
        return outView;
    }
    
    return nil;
}

#pragma mark ---------------- other-----------------
/**
 * @brief 移除此view上的所有子视图
 */
- (void)removeAllSubviews
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    return;
}

/**
 分割线

 @param frame 坐标
 @param backgroundColor 分割线的颜色
 @return separateView
 */
+ (UIView *)separateLineWithFrame:(CGRect)frame color:(UIColor *)backgroundColor
{
    UIView *separateView = [[self alloc] initWithFrame:frame];
    separateView.backgroundColor = backgroundColor;
    return separateView;
}


@end
