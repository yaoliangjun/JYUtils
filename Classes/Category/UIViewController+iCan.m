//
//  UIViewController+iCan.m
//  iCan
//
//  Created by Jerry Yao on 17/3/17.
//  Copyright © 2017年 LinkedTech. All rights reserved.
//

#import "UIViewController+iCan.h"

@implementation UIViewController (iCan)

/**
 显示一个AlertView,两秒钟后消失

 @param title 显示的标题
 @param message 显示的内容
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertController *alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yesButton = [UIAlertAction
                                actionWithTitle:NSLocalizedString(@"Ok", nil)
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                }];
    [alert addAction:yesButton];
    [self presentViewController:alert animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:yesButton completion:nil];
    });
}


/**
 显示一个AlertView
 
 @param title 显示的标题
 @param message 显示的内容
 @param isReturn 是否要回到上一个页面
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message isReturn:(BOOL)isReturn
{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:NSLocalizedString(@"Ok", nil)
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    
                                    if (isReturn) {
                                        [self.navigationController popViewControllerAnimated:YES];
                                    }
                                    
                                }];
    [alert addAction:yesButton];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
