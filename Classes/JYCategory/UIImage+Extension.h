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

/** 从一个控件中截取指定大小的图片 */
+ (UIImage *)imageFromView :(UIView *)view size:(CGSize)size;

/** 从图片中按指定的位置大小截取图片的一部分 */
+ (UIImage *)cutImageFromImage:(UIImage *)image inRect:(CGRect)rect;

/** 生成二维码 */
+ (UIImage *)createQRCodeImageWithString:(NSString *)string size:(CGSize)size;

/** 生成条形码 */
+ (instancetype)createBarCodeImageWithString:(NSString *)string size:(CGSize)size;

@end

