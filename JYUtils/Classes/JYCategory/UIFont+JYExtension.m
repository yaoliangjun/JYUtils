//
//  UIFont+JYExtension.m
//  JYUtils
//
//  Created by Jerry on 2020/11/25.
//

#import "UIFont+JYExtension.h"

/// 各种字重的简体苹方 字体名
#define kPREFIX     @"PingFangSC-"
#define kTHIN       kPREFIX@"Thin"
#define kLIGHT      kPREFIX@"Light"
#define kREGULAR    kPREFIX@"Regular"
#define kMEDIUM     kPREFIX@"Medium"
#define kSEMIBOLD   kPREFIX@"Semibold"

@implementation UIFont (JYExtension)

+ (instancetype)pingFangThinWithSize:(CGFloat)size {
    if (@available(iOS 8.2, *)) {
        return [self systemFontOfSize:size weight:UIFontWeightThin];
    } else {
        return [self fontWithName:kTHIN size:size];
    }
}

+ (instancetype)pingFangLightWithSize:(CGFloat)size {
    if (@available(iOS 8.2, *)) {
        return [self systemFontOfSize:size weight:UIFontWeightLight];
    } else {
        return [self fontWithName:kLIGHT size:size];
    }
}

+ (instancetype)pingFangRegularWithSize:(CGFloat)size {
    if (@available(iOS 8.2, *)) {
        return [self systemFontOfSize:size weight:UIFontWeightRegular];
    } else {
        return [self fontWithName:kREGULAR size:size];
    }
}

+ (instancetype)pingFangMediumWithSize:(CGFloat)size {
    if (@available(iOS 8.2, *)) {
        return [self systemFontOfSize:size weight:UIFontWeightMedium];
    } else {
        return [self fontWithName:kMEDIUM size:size];
    }
}

+ (instancetype)pingFangSemiboldWithSize:(CGFloat)size {
    if (@available(iOS 8.2, *)) {
        return [self systemFontOfSize:size weight:UIFontWeightSemibold];
    } else {
        return [self fontWithName:kSEMIBOLD size:size];
    }
}

@end
