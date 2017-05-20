//
//  NSDate+iCan.h
//  iCan
//
//  Created by Jerry Yao on 17/3/16.
//  Copyright © 2017年 LinkedTech. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MM @"MM"
#define MMM @"MMM" // 如果是中文环境: '4月', 英文: 'APR'
#define YYYY @"yyyy"
#define YYYY_MM @"yyyy-MM"
#define HH_MM @"HH:mm"
#define MM_DD @"MM/dd"
#define YY_MM               @"yy-MM"
#define YY_MM_DD            @"yy-MM-dd"
#define YYYY_MM_DD          @"yyyy-MM-dd"
#define YY_MM_DD_HH_MM      @"yy-MM-dd HH:mm"
#define YYYY_MM_DD_HH_MM      @"yyyy-MM-dd HH:mm"
#define YYYY_MM_DD_HH_MM_SS @"yyyy-MM-dd HH:mm:ss"

@interface NSDate (iCan)

/**
 毫秒转成指定格式的时间字符串
 
 @param millisecond 毫秒
 @param formatter 时间格式
 @return 时间字符串
 */
+ (NSString *)dateWithMillisecond:(NSString *)millisecond formatter:(NSString *)formatter;


/**
 把一个指定格式的时间字符串，转换成毫秒字符串
 
 @param dateString 时间字符串
 @param formatter 时间字符串的格式
 @return 毫秒数
 */
+ (NSString *)millisecondWithDateString:(NSString *)dateString formatter:(NSString *)formatter;


/**
 把一个指定格式的时间，转换成毫秒字符串
 
 @param date 时间
 @param formatter 时间字符串的格式
 @return 毫秒数
 */
+ (NSString *)millisecondWithDate:(NSDate *)date formatter:(NSString *)formatter;


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
 通过一个NSDate和时间格式获取时间字符串
 
 @param date NSDate日期
 @param formatter 时间格式
 @return 时间字符串
 */
+ (NSString *)dateStringWithDate:(NSDate *)date formatter:(NSString *)formatter;


/**
 获取指定时间格式的当前时间字符串
 
 @param formatter 指定的时间格式
 @return 当前时间字符串
 */
+ (NSString *)currentDateStringWithFormatter:(NSString *)formatter;


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

@end
