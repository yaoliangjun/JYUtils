//
//  UIAlertController+iCan.m
//  iCan
//
//  Created by Jerry Yao on 2017/6/2.
//  Copyright © 2017年 LinkedTech. All rights reserved.
//

#import "UIAlertController+iCan.h"

@implementation UIAlertController (iCan)

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
                                 negativeHandle:(NegativeHandle)negativeHandle
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // 确定按钮
    UIAlertAction *positiveAction = [UIAlertAction actionWithTitle:positiveActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
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
                                 positiveHandle:(PositiveHandle)positiveHandle
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // 确定按钮
    UIAlertAction *positiveAction = [UIAlertAction actionWithTitle:positiveActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if (positiveHandle) {
            positiveHandle(alertController);
        }
    }];
    
    [alertController addAction:positiveAction];
    
    return alertController;
}

@end
