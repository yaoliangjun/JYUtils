//
//  NSBundle+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 2017/6/19.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//  语言切换

#import <Foundation/Foundation.h>

@interface NSBundle (Extension)

/** 设置APP语言 */
+ (void)setLanguage:(NSString *)language;

/** 获取APP名字 */
+ (NSString *)appName;

/** 获取APP版本号 */
+ (NSString *)appVersion;

/** 获取APP编译版本号 */
+ (NSString *)appBuildVersion;

@end

