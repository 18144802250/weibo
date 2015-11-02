//
//  UserResult.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/27.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "UserResult.h"

@implementation UserResult

- (int)messageCount
{
    return _cmt + _dm + _mention_cmt + _mention_status;
}

- (int)totalCount
{
    return self.messageCount + _status + _follower;
}

@end
