//
//  UIFont+JYExtension.h
//  JYUtils
//
//  Created by Jerry on 2020/11/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (JYExtension)

/** 简体苹方 Thin */
+ (instancetype)pingFangThinWithSize:(CGFloat)size;

/** 简体苹方 Light */
+ (instancetype)pingFangLightWithSize:(CGFloat)size;

/** 简体苹方 Regular */
+ (instancetype)pingFangRegularWithSize:(CGFloat)size;

/** 简体苹方 Medium */
+ (instancetype)pingFangMediumWithSize:(CGFloat)size;

/** 简体苹方 Semibold */
+ (instancetype)pingFangSemiboldWithSize:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
