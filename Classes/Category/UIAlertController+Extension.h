//
//  UIAlertController+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 2017/6/2.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PositiveHandle)(UIAlertController *alertController);
typedef void (^NegativeHandle)(UIAlertController *alertController);

@interface UIAlertController (Extension)

/**
 UIAlertController封装(确定、取消两个按钮)
 
 @param title 标题
 @param message 内容
 @param positiveActionTitle 确定按钮标题
 @param positiveHandle 确定回调
 @param negativeActionTitle 取消按钮标题
 @param negativeHandle 取消按钮回调
 @return UIAlertController
 */
+ (UIAlertController *)alertControllerWithTitle:(NSString *)title
                                        message:(NSString *)message
                            positiveActionTitle:(NSString *)positiveActionTitle
                                 positiveHandle:(PositiveHandle)positiveHandle
                            negativeActionTitle:(NSString *)negativeActionTitle
                                 negativeHandle:(NegativeHandle)negativeHandle;

/**
 UIAlertController封装(只有确定按钮)
 
 @param title 标题
 @param message 内容
 @param positiveActionTitle 确定按钮标题
 @param positiveHandle 确定回调
 @return UIAlertController
 */
+ (UIAlertController *)alertControllerWithTitle:(NSString *)title
                                        message:(NSString *)message
                            positiveActionTitle:(NSString *)positiveActionTitle
                                 positiveHandle:(PositiveHandle)positiveHandle;
@end
