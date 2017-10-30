//
//  UIImage+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 17/3/8.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (Extension)
 
 /** 把颜色转换为图片 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/** 返回一张可以随意拉伸不变形的图片 */
+ (UIImage *)resizableImage:(NSString *)imageName;

@end
