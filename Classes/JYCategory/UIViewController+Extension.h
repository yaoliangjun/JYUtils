//
//  UIViewController+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 17/3/17.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

/**
 显示一个AlertView,两秒钟后消失

 @param title 显示的标题
 @param message 显示的内容
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

/**
 显示一个AlertView,需要自己点击确定

 @param title 显示的标题
 @param message 显示的内容
 @param isReturn 是否要回到上一个页面
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message isReturn:(BOOL)isReturn;

@end

