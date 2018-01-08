//
//  NSData+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 2017/4/22.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Extension)

// 把base64编码的头像转为NSData
+ (NSData *)base64String2Image:(NSString *)base64Str;

@end

