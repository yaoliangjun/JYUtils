//
//  NSData+iCan.h
//  iCan
//
//  Created by Jerry Yao on 2017/4/22.
//  Copyright © 2017年 LinkedTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (iCan)

// 把base64编码的头像转为NSData
+ (NSData *)base64String2Image:(NSString *)base64Str;

@end
