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

/**
 把颜色转换为图片

 @param color 图片的颜色
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
