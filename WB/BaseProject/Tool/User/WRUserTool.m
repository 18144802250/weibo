//
//  WRUserTool.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/27.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "WRUserTool.h"
#import "WRAccountTool.h"

@implementation WRUserTool

+ (void)unreadWithCompletionHandle:(void (^)(UserResult *, NSError *))complete
{
    NSMutableDictionary *params = [NSMutableDictionary new];
    params[@"access_token"] = [WRAccountTool account].access_token;
    params[@"uid"] = [WRAccountTool account].uid;
    
    [self GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameters:params completeHandle:^(id responseObj, NSError *error) {
        
        complete([UserResult objectWithKeyValues:responseObj],error);
    }];
}

+ (void)userInfoWithCompletionHandle:(void (^)(StatusUserModel *, NSError *))complete
{
    NSMutableDictionary *params = [NSMutableDictionary new];
    params[@"access_token"] = [WRAccountTool account].access_token;
    params[@"uid"] = [WRAccountTool account].uid;
    
    [self GET:@"https://api.weibo.com/2/users/show.json" parameters:params completeHandle:^(id responseObj, NSError *error) {
        
        complete([StatusUserModel objectWithKeyValues:responseObj],error);
    }];
}

@end
