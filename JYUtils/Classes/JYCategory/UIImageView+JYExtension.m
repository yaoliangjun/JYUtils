//
//  UIImageView+JYExtension.m
//  JYUtils
//
//  Created by Jerry Yao on 2019/10/25.
//

#import "UIImageView+JYExtension.h"

@implementation UIImageView (JYExtension)

+ (UIImageView *)imageViewWithNamed:(NSString *)imageNamed {
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
}

@end
