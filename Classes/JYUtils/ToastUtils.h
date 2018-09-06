//
//  ToastUtils.h
//  JYUtils
//
//  Created by Jerry Yao on 2018/4/18.
//  Copyright © 2018年 Jerry Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MBProgressHUD;

// HUD显示时长
typedef NS_ENUM(NSInteger, JYDuration) {
    JYDurationShort = 1,
    JYDurationLong = 2
};

@interface ToastUtils : NSObject

#pragma mark - 显示然后消失
/** 默认的HUD，1.5秒后消失 */
+ (void)showWithStatus:(NSString *)status;

/**
 HUD消失后再做一些事情
 @param status 显示的文字
 @param completionHandle 回调
 */
+ (void)showWithStatus:(NSString *)status completionHandle:(void(^)(void))completionHandle;

/**
 HUD消失后再做一些事情:显示1秒
 @param status 显示的文字
 */
+ (void)showShortWithStatus:(NSString *)status;

/**
 HUD消失后再做一些事情:显示1秒
 @param status 显示的文字
 @param completionHandle 回调
 */
+ (void)showShortWithStatus:(NSString *)status completionHandle:(void(^)(void))completionHandle;

/**
 HUD消失后再做一些事情:显示2秒
 @param status 显示的文字
 @param completionHandle 回调
 */
+ (void)showLongWithStatus:(NSString *)status completionHandle:(void(^)(void))completionHandle;

/**
 HUD消失后再做一些事情
 @param status 显示的文字
 @param duration 显示多久,单位是秒
 @param completionHandle 回调
 */
+ (void)showWithStatus:(NSString *)status duration:(float)duration completionHandle:(void(^)(void))completionHandle;

/**
 显示一个HUD
 @param status 需要显示的文字
 @param duration 显示多久,单位是秒
 */
+ (void)showWithStatus:(NSString *)status duration:(float)duration;

/** 显示一个图片HUD */
+ (void)showWithStatus:(NSString *)status imageName:(NSString *)imageName;

#pragma mark - 持续显示
/** 显示菊花HUD */
+ (void)showLoading;

/** 显示带文字的菊花HUD */
+ (void)showLoadingWithStatus:(NSString *)status;

/** 显示菊花加载框,N秒后消失 */
+ (void)showLoadingWithDuration:(float)duration;

/** 隐藏菊花HUD */
+ (void)dismiss;

@end
