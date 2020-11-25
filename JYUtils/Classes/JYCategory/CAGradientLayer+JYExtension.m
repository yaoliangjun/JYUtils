//
//  CAGradientLayer+JYExtension.m
//  JYUtils
//
//  Created by Jerry on 2020/11/25.
//

#import "CAGradientLayer+JYExtension.h"

@implementation CAGradientLayer (JYExtension)

+ (CAGradientLayer *)gradientLayerWithFrame:(CGRect)frame startColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.frame = frame;
    gradientLayer.colors = [NSArray arrayWithObjects:(id)startColor.CGColor, (id)endColor.CGColor, nil];
    return gradientLayer;
}

@end
