//
//  NSBundle+JYExtension.m
//  JYUtils
//
//  Created by Jerry Yao on 2017/6/19.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//  NSBundle

#import "NSBundle+JYExtension.h"
#import <objc/runtime.h>

static const char _bundle = 0;

@interface JYBundleEx : NSBundle

@end

@implementation JYBundleEx

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    NSBundle *bundle = objc_getAssociatedObject(self, &_bundle);
    return bundle ? [bundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}

@end

@implementation NSBundle (JYExtension)

/** 设置APP语言 */
+ (void)setLanguage:(NSString *)language {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle], [JYBundleEx class]);
    });

    objc_setAssociatedObject([NSBundle mainBundle], &_bundle, language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/** 获取APP版本 */
+ (NSString *)appName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

/** 获取APP版本号 */
+ (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

/** 获取APP编译版本号 */
+ (NSString *)appBuildVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

/** 获取APP BundleID */
+ (NSString *)appBundleID {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

/** 获取指定的Bundle */
+ (NSBundle *)bundleWithName:(NSString *)bundleName {
    NSURL *url = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];
    if (url) {
        return [NSBundle bundleWithURL:url];
    }
    
    return nil;
}

@end
