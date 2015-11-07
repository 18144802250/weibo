//
//  NSDate+WR.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/30.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "NSDate+WR.h"

@implementation NSDate (WR)

/**
 *  是否是今年的微博
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;
}

/**
 *  是否是今天
 */
- (BOOL)isToDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return (nowCmps.year == selfCmps.year) && (nowCmps.month == selfCmps.month) && (nowCmps.day == selfCmps.day);
}

/**
 *  是否是昨天
 */
- (BOOL)isYesterday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    NSDate *selfDate = [self dateWithYMD];
    //天数相差
    NSDateComponents *dateCmps = [calendar components:unit fromDate:nowDate toDate:selfDate options:0];
    return dateCmps.day == 1;
}

/**
 *  返回一个只有年月日的日期
 */
- (NSDate *)dateWithYMD
{
    NSDateFormatter *dateFm = [NSDateFormatter new];
    dateFm.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [dateFm stringFromDate:self];
    return [dateFm dateFromString:selfStr];
}

/**
 *  获得与当前的时间差
 */
- (NSDateComponents *)intervalFromNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}


@end
