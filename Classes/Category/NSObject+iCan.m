//
//  NSObject+iCan.m
//  iCan
//
//  Created by Jerry Yao on 2017/5/2.
//  Copyright © 2017年 LinkedTech. All rights reserved.
//

#import "NSObject+iCan.h"

@implementation NSObject (iCan)

// 获取当前显示的栈顶控制器
+ (UIViewController *)topViewController
{
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
        
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
        
    } else if (rootViewController.presentedViewController) {
        UIViewController *presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
        
    } else {
        return rootViewController;
    }
}

@end
