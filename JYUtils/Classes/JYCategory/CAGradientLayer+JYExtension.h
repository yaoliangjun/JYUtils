//
//  CAGradientLayer+JYExtension.h
//  JYUtils
//
//  Created by Jerry on 2020/11/25.
//

NS_ASSUME_NONNULL_BEGIN

@interface CAGradientLayer (JYExtension)

+ (CAGradientLayer *)gradientLayerWithFrame:(CGRect)frame startColor:(UIColor *)startColor endColor:(UIColor *)endColor;

@end

NS_ASSUME_NONNULL_END
