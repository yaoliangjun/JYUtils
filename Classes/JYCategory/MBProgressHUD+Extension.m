//
//  MBProgressHUD+Extension.m
//  JYUtils
//
//  Created by Jerry Yao on 2018/1/5.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "MBProgressHUD+Extension.h"

#define kHUDKeyWindow [UIApplication sharedApplication].keyWindow
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kHUDBackgroundColor kHUDHexRGB(0x000000)
#define kHUDTextFont [UIFont systemFontOfSize:12]
#define kHUDTextColor [UIColor whiteColor]
#define kHUDHexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

static NSTimeInterval kHUDDelayInterval = HUDDurationLong;
static CGFloat        kHUDAlpha = 0.8;
static CGFloat        kHUDCornerRadius = 4;

@implementation MBProgressHUD (Extension)

#pragma mark - 显示然后消失
/** 默认的HUD，2秒后消失 */
+ (void)showWithStatus:(NSString *)status
{
    [self showWithStatus:status duration:kHUDDelayInterval];
}

/**
 HUD消失后再做一些事情
 @param status 显示的文字
 @param completionHandle 回调
 */
+ (void)showWithStatus:(NSString *)status completionHandle:(void(^)())completionHandle
{
    [self showWithStatus:status duration:kHUDDelayInterval];

    if (completionHandle) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kHUDDelayInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completionHandle();
        });
    }
}

/**
 HUD消失后再做一些事情:显示1秒
 @param status 显示的文字
 @param completionHandle 回调
 */
+ (void)showShortWithStatus:(NSString *)status completionHandle:(void(^)())completionHandle
{
    [self showWithStatus:status duration:HUDDurationShort];

    if (completionHandle) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(HUDDurationShort * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completionHandle();
        });
    }
}

/**
 HUD消失后再做一些事情:显示2秒
 @param status 显示的文字
 @param completionHandle 回调
 */
+ (void)showLongWithStatus:(NSString *)status completionHandle:(void(^)())completionHandle
{
    [self showWithStatus:status duration:HUDDurationLong];

    if (completionHandle) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(HUDDurationLong * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completionHandle();
        });
    }
}

/**
 HUD消失后再做一些事情
 @param status 显示的文字
 @param duration 显示多久,单位是秒
 @param completionHandle 回调
 */
+ (void)showWithStatus:(NSString *)status duration:(float)duration completionHandle:(void(^)())completionHandle
{
    [self showWithStatus:status duration:duration];

    if (completionHandle) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completionHandle();
        });
    }
}

/**
 显示一个HUD
 @param status 需要显示的文字
 @param duration 显示多久,单位是秒
 */
+ (void)showWithStatus:(NSString *)status duration:(float)duration
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD defaultHUD];
        hud.mode = MBProgressHUDModeText;
        hud.label.font = kHUDTextFont;
        hud.label.text = status;
        hud.label.textColor = kHUDTextColor;
        hud.label.numberOfLines = 0;
        [hud hideAnimated:NO afterDelay:duration];
    });
}

// 显示一个图片HUD
+ (void)showStatus:(NSString *)status imageName:(NSString *)imageName
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD defaultHUD];
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
+ (MBProgressHUD *)defaultHUD
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kHUDKeyWindow animated:YES];
    hud.bezelView.backgroundColor = kHUDBackgroundColor;
    hud.bezelView.alpha = kHUDAlpha;
    hud.bezelView.layer.cornerRadius = kHUDCornerRadius;
    hud.contentColor = kHUDTextColor;

    return hud;
}

#pragma mark - 持续显示
/** 显示菊花HUD */
+ (void)showLoading
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD defaultHUD];
        CGFloat hudWH = 100;
        CGRect frame = hud.frame;
        frame = CGRectMake((SCREEN_WIDTH - hudWH) / 2, (SCREEN_HEIGHT - hudWH) / 2, hudWH, hudWH);
        hud.frame = frame;
        kHUDKeyWindow.userInteractionEnabled = NO; // 禁止交互
    });
}

/** 显示带文字的菊花HUD */
+ (void)showLoadingWithStatus:(NSString *)status
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD defaultHUD];
        hud.label.text = status;
        hud.label.numberOfLines = 0;
        hud.label.font = kHUDTextFont;
    });
}

/** 显示菊花加载框,N秒后消失 */
+ (void)showLoadingWithDuration:(float)duration
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD defaultHUD];
        CGFloat hudWH = 100;
        CGRect frame = hud.frame;
        frame = CGRectMake((SCREEN_WIDTH - hudWH) / 2, (SCREEN_HEIGHT - hudWH) / 2, hudWH, hudWH);
        hud.frame = frame;
        kHUDKeyWindow.userInteractionEnabled = NO; // 禁止交互
        [hud hideAnimated:NO afterDelay:duration];
        kHUDKeyWindow.userInteractionEnabled = YES; // 允许交互
    });
}

/** 隐藏菊花HUD */
+ (void)dismiss
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD HUDForView:kHUDKeyWindow];
        [hud hideAnimated:NO];
        kHUDKeyWindow.userInteractionEnabled = YES; // 允许交互
    });
}

@end

