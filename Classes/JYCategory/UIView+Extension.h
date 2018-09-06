//
//  UIView+Extension.h
//  JYUtils
//
//  Created by Jerry.Yao on 15-11-20.
//  Copyright (c) 2015年 Jerry Yao. All rights reserved.
//

@interface UIView (Extension)

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

/** 抖动 */
- (void)shake;

/** 移除此view上的所有子视图 */
- (void)removeAllSubviews;

/** 创建一条分割线(有颜色) */
+ (UIView *)viewWithColor:(UIColor *)color;

/** 创建一条分割线(有Frame、颜色) */
+ (UIView *)lineWithFrame:(CGRect)frame color:(UIColor *)color;

@end
