//
//  BaseNetManager.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/24.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatusModel.h"
#import "WRUpdateParams.h"

@interface BaseNetManager : NSObject

+ (id)GET:(NSString*)path parameters:(NSDictionary*)params completeHandle:(void(^)(id responseObj, NSError *error))complete;

+ (id)POST:(NSString*)path parameters:(NSDictionary*)params completeHandle:(void(^)(id responseObj, NSError *error))complete;

+ (id)UPDATE:(NSString*)path parameters:(NSDictionary*)params uploadParam:(WRUpdateParams *)uploadParam  completeHandle:(void(^)(id responseObj, NSError *error))complete;

@end
