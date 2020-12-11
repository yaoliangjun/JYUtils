//
//  NSObject+JYExtension.m
//  JYUtils
//
//  Created by Jerry Yao on 2017/5/2.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "NSObject+JYExtension.h"

@implementation NSObject (JYExtension)

// 获取当前显示的栈顶控制器
+ (UIViewController *)topViewController {
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        UIViewController *selectedVC = tabBarController.selectedViewController;
        if (!selectedVC) {
            return tabBarController;
        }
        return [self topViewControllerWithRootViewController:selectedVC];

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
