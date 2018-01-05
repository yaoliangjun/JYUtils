//
//  UIAlertController+Extension.m
//  JYUtils
//
//  Created by Jerry Yao on 2017/6/2.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "UIAlertController+Extension.h"

@implementation UIAlertController (Extension)

/**
 UIAlertController封装(确定、取消两个按钮)

 @param title 标题
 @param message 内容
 @param alertStyle 弹出框样式
 @param isDestructive 是否毁灭性(红色)
 @param positiveActionTitle 确定按钮标题
 @param positiveHandle 确定回调
 @param negativeActionTitle 取消按钮标题
 @param negativeHandle 取消按钮回调
 @return UIAlertController
 */
+ (UIAlertController *)alertWithTitle:(NSString *)title
                              message:(NSString *)message
                           alertStyle:(UIAlertControllerStyle)alertStyle
                        isDestructive:(BOOL)isDestructive
                  positiveActionTitle:(NSString *)positiveActionTitle
                       positiveHandle:(PositiveHandle)positiveHandle
                  negativeActionTitle:(NSString *)negativeActionTitle
                       negativeHandle:(NegativeHandle)negativeHandle
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertStyle];

    UIAlertActionStyle actionStyle = UIAlertActionStyleDefault;
    if (isDestructive) {
        actionStyle = UIAlertActionStyleDestructive;
    }

    // 确定按钮
    UIAlertAction *positiveAction = [UIAlertAction actionWithTitle:positiveActionTitle style:actionStyle handler:^(UIAlertAction *action) {
        if (positiveHandle) {
            positiveHandle(alertController);
        }
    }];

    // 取消按钮
    UIAlertAction *negativeAction = [UIAlertAction actionWithTitle:negativeActionTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        if (negativeHandle) {
            negativeHandle(alertController);
        }
    }];

    [alertController addAction:positiveAction];
    [alertController addAction:negativeAction];

    return alertController;
}

/**
 UIAlertController封装(只有一个按钮)

 @param title 标题
 @param message 内容
 @param positiveActionTitle 确定按钮标题
 @param positiveHandle 确定回调
 @return UIAlertController
 */
+ (UIAlertController *)alertWithTitle:(NSString *)title
                              message:(NSString *)message
                                style:(UIAlertControllerStyle)style
                  positiveActionTitle:(NSString *)positiveActionTitle
                       positiveHandle:(PositiveHandle)positiveHandle
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];

    UIAlertAction *positiveAction = [UIAlertAction actionWithTitle:positiveActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if (positiveHandle) {
            positiveHandle(alertController);
        }
    }];

    [alertController addAction:positiveAction];

    return alertController;
}

@end
