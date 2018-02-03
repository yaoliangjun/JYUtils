//
//  NSMutableArray+Extension.m
//  JYUtils
//
//  Created by yaoliangjun on 2018/2/3.
//

#import "NSMutableArray+Extension.h"

@implementation NSMutableArray (Extension)

/** 过滤掉数组中相同的元素 */
- (NSMutableArray *)filterSameElements
{
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![array containsObject:obj]) {
            [array addObject:obj];
        }
    }];
    return array;
}

@end
