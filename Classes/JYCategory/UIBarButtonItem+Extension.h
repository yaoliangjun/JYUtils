//
//  UIBarButtonItem+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 2018/1/4.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/** 创建一个UIBarButtonItem: 返回箭头 */
+ (UIBarButtonItem *)arrowButtonItemWithImageName:(NSString *)imageName target:(id)target selector:(SEL)selector;

/** 创建一个UIBarButtonItem: 图片(使用系统的按钮) */
+ (UIBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName target:(id)target selector:(SEL)selector;

/** 创建一个UIBarButtonItem: 图片(使用自定义的按钮) */
+ (UIBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName target:(id)target selector:(SEL)selector;

/** 创建一个UIBarButtonItem: 文字 */
+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target selector:(SEL)selector;

@end

