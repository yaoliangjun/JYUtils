//
//  NSDate+iCan.m
//  iCan
//
//  Created by Jerry Yao on 17/3/16.
//  Copyright © 2017年 LinkedTech. All rights reserved.
//

#import "NSDate+iCan.h"

@implementation NSDate (iCan)

/**
 毫秒转成指定格式的时间字符串
 
 @param millisecond 毫秒
 @param formatter 时间格式
 @return 时间字符串
 */
+ (NSString *)dateWithMillisecond:(NSString *)millisecond formatter:(NSString *)formatter
{
    if (!millisecond || !formatter) {
        return@"";
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:([millisecond doubleValue] / 1000)];
    NSDateFormatter *mFormatter = [[NSDateFormatter alloc] init];
    [mFormatter setDateFormat:formatter]; // @"yy/MM/dd HH:mm"
    
    return [mFormatter stringFromDate:date];
}


/**
 把一个指定格式的时间字符串，转换成毫秒字符串
 
 @param dateString 时间字符串
 @param formatter 时间字符串的格式
 @return 毫秒数
 */
+ (NSString *)millisecondWithDateString:(NSString *)dateString formatter:(NSString *)formatter
{
    if (!dateString || !formatter) {
        return@"";
    }
    
    NSDateFormatter *mFormatter = [[NSDateFormatter alloc] init];
    mFormatter.dateFormat = formatter;
    NSString *millisecondStr = [NSString stringWithFormat:@"%.0f", ([[mFormatter dateFromString:dateString] timeIntervalSince1970]) * 1000];
    
    return millisecondStr;
}

/**
 把一个指定格式的时间，转换成毫秒字符串
 
 @param date 时间
 @param formatter 时间字符串的格式
 @return 毫秒数
 */
+ (NSString *)millisecondWithDate:(NSDate *)date formatter:(NSString *)formatter
{
    if (!date || !formatter) {
        return @"";
    }
    
    // 设置时间格式
    NSDateFormatter *mFormatter = [[NSDateFormatter alloc] init];
    mFormatter.dateFormat = formatter;
    
    // 把时间转成时间字符串
    NSString *dateString = [mFormatter stringFromDate:date];
    NSString *millisecondStr = [NSString stringWithFormat:@"%.0f", ([[mFormatter dateFromString:dateString] timeIntervalSince1970]) * 1000];
    
    return millisecondStr;
}


/**
 把一个时间字符串转换成指定格式的时间字符串
 
 @param dateString e.g. @"2017-02-27 18:22"
 @param formatter 时间格式
 @return 指定格式的时间字符串 e.g. @"17-02-27 18:22"
 */
+ (NSString *)dateStringWithString:(NSString *)dateString formatter:(NSString *)formatter
{
    if (!dateString || !formatter) {
        return @"";
    }
    
    NSDateFormatter *mFormatter = [[NSDateFormatter alloc] init];
    [mFormatter setDateFormat:formatter];
    NSDate *date = [mFormatter dateFromString:dateString];
    
    return [mFormatter stringFromDate:date];
}


/**
 把一个时间字符串转换成指定格式的时间
 
 @param dateString e.g. @"2017-02-27 18:22"
 @param formatter 时间格式
 @return 指定格式的时间 e.g. @"17-02-27 18:22"
 */
+ (NSDate *)dateWithString:(NSString *)dateString formatter:(NSString *)formatter
{
    if (!dateString || !formatter) {
        return [NSDate date];
    }
    
    NSDateFormatter *mFormatter = [[NSDateFormatter alloc] init];
    [mFormatter setDateFormat:formatter];
    
    NSDate *date = [mFormatter dateFromString:dateString];
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone]; // 获取系统的时区
    NSInteger interval = [timeZone secondsFromGMTForDate: date];// local时间距离GMT的秒数
    NSDate *localeDate = [date dateByAddingTimeInterval: interval];
    
    return localeDate;
}


/**
 通过一个NSDate和时间格式获取时间字符串
 
 @param date NSDate日期
 @param formatter 时间格式
 @return 时间字符串
 */
+ (NSString *)dateStringWithDate:(NSDate *)date formatter:(NSString *)formatter
{
    if (!date || !formatter) {
        return @"";
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:date];
}

/**
 获取指定时间格式的当前时间字符串
 
 @param formatter 指定的时间格式
 @return 当前时间字符串
 */
+ (NSString *)currentDateStringWithFormatter:(NSString *)formatter
{
    if (!formatter) {
        return @"";
    }
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:date];
}


/**
 获取一个时间字符串的年份
 
 @param dateString 时间字符串
 @param formatter 时间字符串的格式
 @return 时间字符串的年份
 */
+ (NSString *)yearWithDateString:(NSString *)dateString dateStringFormatter:(NSString *)formatter
{
    NSDate *date = [self dateWithString:dateString formatter:formatter];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:YYYY];
    return [dateFormatter stringFromDate:date];
}

/**
 获取一个时间字符串的月份(月份是英文格式)
 
 @param dateString 时间字符串
 @param formatter 时间字符串的格式
 @return 时间字符串的月份
 */
+ (NSString *)monthWithDateString:(NSString *)dateString dateStringFormatter:(NSString *)formatter monthFormatter:(NSString *)monthFormatter
{
    NSDate *date = [self dateWithString:dateString formatter:formatter];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [dateFormatter setLocale:locale];
    [dateFormatter setDateFormat:monthFormatter]; // 如果需要获取数字的月份把"MMM"改成"MM"即可
    return [[dateFormatter stringFromDate:date] uppercaseString];
}
@end
