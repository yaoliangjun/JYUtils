//
//  UIImage+Extension.m
//  JYUtils
//
//  Created by Jerry Yao on 17/3/8.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

/**
 把颜色转换为图片
 
 @param color 图片的颜色
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
