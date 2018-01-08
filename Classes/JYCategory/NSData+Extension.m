//
//  NSData+Extension.m
//  JYUtils
//
//  Created by Jerry Yao on 2017/4/22.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import "NSData+Extension.h"

@implementation NSData (Extension)

// 把base64编码的头像转为NSData
+ (NSData *)base64String2Image:(NSString *)base64Str
{
    NSData *decodedImageData = [[NSData alloc] initWithBase64EncodedString:base64Str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return decodedImageData;
}

@end

