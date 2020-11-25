//
//  UIDevice+JYExtension.h
//  JYUtils
//
//  Created by Jerry on 2020/11/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (JYExtension)

/** 判断设备是否是在充电中 */
+ (BOOL)isCharging;

/** 获取电池电量 */
+ (float)batteryLevel;

/** 获取手机机型 */
+ (NSString *)deviceName;

/** 获取手机存储 */
+ (int)storage;

@end

NS_ASSUME_NONNULL_END
