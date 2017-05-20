//
//  NSObject+iCan.h
//  iCan
//
//  Created by Jerry Yao on 2017/5/2.
//  Copyright © 2017年 LinkedTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (iCan)

/** 获取当前显示的栈顶控制器 */
+ (UIViewController *)topViewController;

@end
