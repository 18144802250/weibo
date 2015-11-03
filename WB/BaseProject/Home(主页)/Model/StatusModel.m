//
//  StatusModel.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/24.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "StatusModel.h"
#import "NSDate+WR.h"

@implementation StatusModel

+ (NSDictionary *)objectClassInArray
{
    return @{
             @"statuses":[StatusStatusesModel class]
             };
}

+ (NSDictionary*)replacedKeyFromPropertyName
{
    return @{@"totalNumber":@"total_number"};
}

@end

@implementation StatusStatusesModel

+ (NSDictionary *)objectClassInArray
{
    return @{
             @"pic_urls":[StatusPicUrlsModel class],
             };
}

- (NSString *)created_at
{
    NSDateFormatter *fm = [NSDateFormatter new];
    fm.dateFormat = @"EEE MMM d HH:mm:ss z yyyy";
    fm.locale = [NSLocale localeWithLocaleIdentifier:@"en-us"];
    
    NSDate *date = [fm dateFromString:_created_at];
    
    if ([date isThisYear]) {
        if ([date isToDay]) {
            NSDateComponents *cmp = [date intervalFromNow];
            if (cmp.hour > 1) {
                return [NSString stringWithFormat:@"%ld小时之前",cmp.hour];
            } else if (cmp.minute > 1) {
                return [NSString stringWithFormat:@"%ld分钟之前",cmp.minute];
            } else {
                return [NSString stringWithFormat:@"刚刚"];
            }
        } else if ([date isYesterday]) {
            fm.dateFormat = @"昨天 HH:mm";
            return [fm stringFromDate:date];
        } else {
            fm.dateFormat = @"前天 HH:mm";
            return [fm stringFromDate:date];
        }
    } else {
        fm.dateFormat = @"yyyy-MM-dd HH:mm";
        return [fm stringFromDate:date];
    }
}

- (void)setSource:(NSString *)source
{
    if (!source || [source isEqualToString:@""]) {
        _source = source;
        return;
    }
    NSRange range = [source rangeOfString:@">"];
    source = [source substringFromIndex:range.location + range.length];
    range = [source rangeOfString:@"<"];
    source = [source substringToIndex:range.location];
    _source = [NSString stringWithFormat:@"来自%@",source];
}

- (void)setRetweeted_status:(StatusStatusesModel *)retweeted_status
{
    _retweeted_status = retweeted_status;
    _retweetName = [NSString stringWithFormat:@"@%@",retweeted_status.user.name];
}

@end

@implementation StatusPicUrlsModel

+ (NSDictionary*)replacedKeyFromPropertyName
{
    return @{@"thumbnailPic":@"thumbnail_pic"};
}

@end

@implementation StatusUserModel

-(void)setMbtype:(int)mbtype
{
    _mbtype = mbtype;
    _vip = mbtype > 2;
}

@end

