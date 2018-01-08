//
//  MBProgressHUD+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 2018/1/5.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "MBProgressHUD.h"

// HUD显示时长
typedef NS_ENUM(NSInteger, HUDDuration) {
    HUDDurationShort = 1,
    HUDDurationLong = 2
};

@interface MBProgressHUD (Extension)


#pragma mark - 显示然后消失
/** 默认的HUD，2秒后消失 */
+ (void)showWithStatus:(NSString *)status;

/**
 HUD消失后再做一些事情
 @param status 显示的文字
 @param completionHandle 回调
 */
+ (void)showWithStatus:(NSString *)status completionHandle:(void(^)())completionHandle;

/**
 HUD消失后再做一些事情:显示1秒
 @param status 显示的文字
 @param completionHandle 回调
 */
+ (void)showShortWithStatus:(NSString *)status completionHandle:(void(^)())completionHandle;

/**
 HUD消失后再做一些事情:显示2秒
 @param status 显示的文字
 @param completionHandle 回调
 */
+ (void)showLongWithStatus:(NSString *)status completionHandle:(void(^)())completionHandle;

/**
 HUD消失后再做一些事情
 @param status 显示的文字
 @param duration 显示多久,单位是秒
 @param completionHandle 回调
 */
+ (void)showWithStatus:(NSString *)status duration:(float)duration completionHandle:(void(^)())completionHandle;

/**
 显示一个HUD
 @param status 需要显示的文字
 @param duration 显示多久,单位是秒
 */
+ (void)showWithStatus:(NSString *)status duration:(float)duration;

/** 显示一个图片HUD */
+ (void)showStatus:(NSString *)status imageName:(NSString *)imageName;

#pragma mark - 持续显示
/** 显示菊花HUD */
+ (void)showLoading;

/** 显示带文字的菊花HUD */
+ (void)showLoadingWithStatus:(NSString *)status;

/** 隐藏菊花HUD */
+ (void)dismiss;

@end
