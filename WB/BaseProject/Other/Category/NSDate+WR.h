//
//  NSDate+WR.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/30.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WR)

/**
 *  是否是今年的微博
 */
- (BOOL)isThisYear;

/**
 *  是否是今天
 */
- (BOOL)isToDay;

/**
 *  是否是昨天
 */
- (BOOL)isYesterday;

/**
 *  返回一个只有年月日的日期
 */
- (NSDate*)dateWithYMD;

/**
 *  获得与当前的时间差
 */
- (NSDateComponents*)intervalFromNow;
@end
