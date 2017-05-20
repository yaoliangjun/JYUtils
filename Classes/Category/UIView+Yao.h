//
//  UIView+Yao.h
//
//  Created by Jerry.Yao on 15-11-20.
//  Copyright (c) 2015年 Jerry Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Yao)

@property (nonatomic, assign) CGFloat   x;
@property (nonatomic, assign) CGFloat   y;
@property (nonatomic, assign) CGFloat   width;
@property (nonatomic, assign) CGFloat   height;
@property (nonatomic, assign) CGPoint   origin;
@property (nonatomic, assign) CGSize    size;
@property (nonatomic, assign) CGFloat   bottom;
@property (nonatomic, assign) CGFloat   right;
@property (nonatomic, assign) CGFloat   centerX;
@property (nonatomic, assign) CGFloat   centerY;
@property (nonatomic, strong, readonly) UIView *lastSubviewOnX;
@property (nonatomic, strong, readonly) UIView *lastSubviewOnY;

/**
 * @brief 抖动
 */
- (void) shake;

/**
 * @brief 移除此view上的所有子视图
 */
- (void)removeAllSubviews;


/**
 分割线
 
 @param frame 坐标
 @param backgroundColor 分割线的颜色
 @return separateView
 */
+ (UIView *)separateLineWithFrame:(CGRect)frame color:(UIColor *)backgroundColor;

@end
