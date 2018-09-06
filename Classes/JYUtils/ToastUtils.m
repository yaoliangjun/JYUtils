//
//  ToastUtils.m
//  JYUtils
//
//  Created by Jerry Yao on 2018/4/18.
//  Copyright © 2018年 Jerry Yao. All rights reserved.
//

#import "ToastUtils.h"
#import "MBProgressHUD.h"

#define kHUDKeyWindow [UIApplication sharedApplication].keyWindow
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kHUDBackgroundColor kHUDHexRGB(0x000000)
#define kHUDTextFont [UIFont systemFontOfSize:12]
#define kHUDTextColor [UIColor whiteColor]
#define kHUDHexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

static NSTimeInterval kHUDDelayInterval = 1.5;
static CGFloat kHUDAlpha = 1;
static CGFloat kHUDCornerRadius = 5;

@implementation ToastUtils

#pragma mark - 显示然后消失
/** 默认的HUD, 1.5秒后消失 */
+ (void)showWithStatus:(NSString *)status {
    [self showWithStatus:status duration:kHUDDelayInterval];
}

+ (void)showWithStatus:(NSString *)status completionHandle:(void (^)(void))completionHandle {
    [self showWithStatus:status duration:kHUDDelayInterval];

    if (completionHandle) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kHUDDelayInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completionHandle();
        });
    }
}

+ (void)showShortWithStatus:(NSString *)status {
    [self showShortWithStatus:status completionHandle:nil];
}

+ (void)showShortWithStatus:(NSString *)status completionHandle:(void (^)(void))completionHandle {
    [self showWithStatus:status duration:JYDurationShort];

    if (completionHandle) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(JYDurationShort * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completionHandle();
        });
    }
}

+ (void)showLongWithStatus:(NSString *)status completionHandle:(void (^)(void))completionHandle {
    [self showWithStatus:status duration:JYDurationLong];

    if (completionHandle) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(JYDurationLong * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completionHandle();
        });
    }
}

+ (void)showWithStatus:(NSString *)status duration:(float)duration completionHandle:(void (^)(void))completionHandle {
    [self showWithStatus:status duration:duration];

    if (completionHandle) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completionHandle();
        });
    }
}

+ (void)showWithStatus:(NSString *)status duration:(float)duration {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [self defaultHUD];
        hud.mode = MBProgressHUDModeText;
        hud.label.font = kHUDTextFont;
        hud.label.text = status;
        hud.label.textColor = kHUDTextColor;
        hud.label.numberOfLines = 0;
        [hud hideAnimated:NO afterDelay:duration];
    });
}

// 显示一个图片HUD
+ (void)showWithStatus:(NSString *)status imageName:(NSString *)imageName {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [self defaultHUD];
        hud.mode = MBProgressHUDModeCustomView;
        UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        hud.customView = [[UIImageView alloc] initWithImage:image];
        hud.square = YES;
        hud.label.font = kHUDTextFont;
        hud.label.text = status;
        hud.label.numberOfLines = 0;
        [hud hideAnimated:NO afterDelay:kHUDDelayInterval];
    });
}

/** 获取一个默认的HUD */
+ (MBProgressHUD *)defaultHUD {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kHUDKeyWindow animated:YES];
    hud.bezelView.backgroundColor = kHUDBackgroundColor;
    hud.bezelView.alpha = kHUDAlpha;
    hud.bezelView.layer.cornerRadius = kHUDCornerRadius;
    hud.contentColor = kHUDTextColor;
    hud.graceTime = 0.5;
    return hud;
}

#pragma mark - 持续显示
+ (void)showLoading {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [self defaultHUD];
        CGFloat hudWH = 100;
        CGRect frame = hud.frame;
        frame = CGRectMake((SCREEN_WIDTH - hudWH) / 2, (SCREEN_HEIGHT - hudWH) / 2, hudWH, hudWH);
        hud.frame = frame;
        kHUDKeyWindow.userInteractionEnabled = NO; // 禁止交互
    });
}

+ (void)showLoadingWithStatus:(NSString *)status {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [self defaultHUD];
        hud.label.text = status;
        hud.label.numberOfLines = 0;
        hud.label.font = kHUDTextFont;
    });
}

+ (void)showLoadingWithDuration:(float)duration {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [self defaultHUD];
        CGFloat hudWH = 100;
        CGRect frame = hud.frame;
        frame = CGRectMake((SCREEN_WIDTH - hudWH) / 2, (SCREEN_HEIGHT - hudWH) / 2, hudWH, hudWH);
        hud.frame = frame;
        kHUDKeyWindow.userInteractionEnabled = NO; // 禁止交互
        [hud hideAnimated:NO afterDelay:duration];
        kHUDKeyWindow.userInteractionEnabled = YES; // 允许交互
    });
}

+ (void)dismiss {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD HUDForView:kHUDKeyWindow];
        [hud hideAnimated:NO];
        kHUDKeyWindow.userInteractionEnabled = YES; // 允许交互
    });
}

@end
