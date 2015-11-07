//
//  WRComposeTool.m
//  BaseProject
//
//  Created by apple-jd28 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WRComposeTool.h"
#import "WRUpdateParams.h"
#import "WRAccountTool.h"

#define WRComposePath @"https://api.weibo.com/2/statuses/update.json"

@implementation WRComposeTool

+ (void)composeWithStatus:(NSString *)status completionHandle:(void (^)( NSError *))completion
{
    NSMutableDictionary *params = [NSMutableDictionary new];
    
    params[@"access_token"] = [WRAccountTool account].access_token;
    
    params[@"status"] = status;
    
    [self POST:WRComposePath parameters:params completeHandle:^(id responseObj, NSError *error) {
        
        completion(error);
    }];
}

+ (void)composeWithStatus:(NSString *)status pic:(UIImage *)pic completionHandle:(void (^)(NSError *))completion
{
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    
    params[@"access_token"] = [WRAccountTool account].access_token;
    
    params[@"status"] = status;
    
    WRUpdateParams *update = [WRUpdateParams new];
    update.data = UIImagePNGRepresentation(pic);
    update.name = @"pic";
    update.fileName = @"image.png";
    update.mimeType = @"image/png";
    
    [self UPDATE:WRComposePath parameters:params uploadParam:update completeHandle:^(id responseObj, NSError *error) {
        completion(error);
    }];
}

@end
