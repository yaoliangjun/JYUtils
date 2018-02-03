//
//  NSDate+Extension.h
//  JYUtils
//
//  Created by Jerry Yao on 17/3/16.
//  Copyright © 2017年 Jerry Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MM                  @"MM"
#define MMM                 @"MMM" // 如果是中文环境: '4月', 英文: 'APR'
#define YYYY                @"yyyy"
#define YYYY_MM             @"yyyy-MM"
#define HH_MM               @"HH:mm"
#define MM_DD               @"MM/dd"
#define YY_MM               @"yy-MM"
#define YY_MM_DD            @"yy-MM-dd"
#define YYYY_MM_DD          @"yyyy-MM-dd"
#define YY_MM_DD_HH_MM      @"yy-MM-dd HH:mm"
#define YYYY_MM_DD_HH_MM    @"yyyy-MM-dd HH:mm"
#define YYYY_MM_DD_HH_MM_SS @"yyyy-MM-dd HH:mm:ss"

@interface NSDate (Extension)

/**
 (毫秒)转成指定格式的时间字符串

 @param millisecond 毫秒
 @param formatter 时间格式
 @return 时间字符串
 */
+ (NSString *)dateStringWithMillisecond:(NSString *)millisecond formatter:(NSString *)formatter;

/**
 秒转成指定格式的时间字符串

 @param second 秒
 @param formatter 时间格式
 @return 时间字符串
 */
+ (NSString *)dateStringWithSecond:(NSString *)second formatter:(NSString *)formatter;

/**
 把一个指定格式的时间字符串，转换成(毫秒字符串)

 @param dateString 时间字符串
 @param formatter 时间字符串的格式
 @return 毫秒数字符串
 */
+ (NSString *)millisecondWithDateString:(NSString *)dateString formatter:(NSString *)formatter;

/**
 把一个指定格式的时间字符串，转换成(秒)字符串

 @param dateString 时间字符串
 @param formatter 时间字符串的格式
 @return 秒数字符串
 */
+ (NSString *)secondWithDateString:(NSString *)dateString formatter:(NSString *)formatter;

/**
 把一个指定格式的时间，转换成毫秒字符串

 @param date 时间
 @param formatter 时间字符串的格式
 @return 毫秒字符串
 */
+ (NSString *)millisecondWithDate:(NSDate *)date formatter:(NSString *)formatter;

/**
 把一个时间转换成指定格式的时间字符串

 @param date e.g. @"2017-02-27 18:22"
 @param formatter 时间格式
 @return 指定格式的时间字符串 e.g. @"17-02-27 18:22"
 */
+ (NSString *)dateStringWithDate:(NSDate *)date formatter:(NSString *)formatter;

/**
 把一个时间字符串转换成指定格式的时间字符串

 @param dateString e.g. @"2017-02-27 18:22"
 @param formatter 时间格式
 @return 指定格式的时间字符串 e.g. @"17-02-27 18:22"
 */
+ (NSString *)dateStringWithString:(NSString *)dateString formatter:(NSString *)formatter;

/**
 把一个时间字符串转换成指定格式的时间

 @param dateString e.g. @"2017-02-27 18:22"
 @param formatter 时间格式
 @return 指定格式的时间 e.g. @"17-02-27 18:22"
 */
+ (NSDate *)dateWithString:(NSString *)dateString formatter:(NSString *)formatter;

/**
 获取指定时间格式的当前时间字符串

 @param formatter 指定的时间格式
 @return 当前时间字符串
 */
+ (NSString *)currentDateStringWithFormatter:(NSString *)formatter;

/**
 获取指定时间格式的当前时间

 @param formatter 指定的时间格式
 @return 当前时间
 */
+ (NSDate *)currentDateWithFormatter:(NSString *)formatter;

/**
 获取一个时间字符串的年份

 @param dateString 时间字符串
 @param formatter 时间字符串的格式
 @return 时间字符串的年份
 */
+ (NSString *)yearWithDateString:(NSString *)dateString dateStringFormatter:(NSString *)formatter;


/**
 获取一个时间字符串的月份(月份是英文格式)

 @param dateString 时间字符串
 @param formatter 时间字符串的格式
 @return 时间字符串的月份
 */
+ (NSString *)monthWithDateString:(NSString *)dateString dateStringFormatter:(NSString *)formatter monthFormatter:(NSString *)monthFormatter;

- (NSInteger)year;

- (NSInteger)month;

- (NSInteger)day;

/**
 把某种格式的时间字符串转换成指定格式的时间字符串

 @param dateString e.g. @"2017-02-27 18:22"
 @return 指定格式的时间字符串 e.g. @"17-02-27 18:22"
 */
+ (NSString *)dateStringWithString:(NSString *)dateString fromFormatter:(NSString *)fromFormatter toFormatter:(NSString *)toFormatter;

/** 获取当前时间的时间戳(秒) */
+ (NSString *)secondWithCurrentDate;

/** 获取当前时间的时间戳(毫秒) */
+ (NSString *)millisecondWithCurrentDate;

@end

