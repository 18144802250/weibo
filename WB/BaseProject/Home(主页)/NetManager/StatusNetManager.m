//
//  StatusNetManager.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/26.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "StatusNetManager.h"
#import "WRAccountTool.h"

@implementation StatusNetManager

+(id)getStatusWithStatusParamType:(StatusParamType)type typeID:(NSString*)typeID completeHandle:(void (^)(StatusModel *model, NSError *))complete
{
    NSString *path = @"https://api.weibo.com/2/statuses/friends_timeline.json";;
    NSMutableDictionary *params = [NSMutableDictionary new];
    if (type == StatusParamTypeMore && typeID != nil) {
        params[@"max_id"] = typeID;
        
    } else if (type == StatusParamTypeNew && typeID != nil){
        params[@"since_id"] = typeID;
    }
    params[@"access_token"] = [WRAccountTool account].access_token;
    
    return [self GET:path parameters:params completeHandle:^(id responseObj, NSError *error) {
//        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
//        path = [path stringByAppendingPathComponent:@"weibo.plist"];
//        BOOL success = [(NSDictionary*)responseObj writeToFile:path atomically:NO];
//        if (success) {
//            NSLog(@"写入成功 %@",path);
//        } else {
//            NSLog(@"写入失败");
//        }
        complete([StatusModel objectWithKeyValues:responseObj],error);
        NSLog(@"111");
    }];
}

@end
