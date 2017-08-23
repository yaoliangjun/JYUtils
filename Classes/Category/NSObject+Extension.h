//
//  NSObject+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 2017/5/2.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (Extension)

/** 获取当前显示的栈顶控制器 */
+ (UIViewController *)topViewController;

@end
