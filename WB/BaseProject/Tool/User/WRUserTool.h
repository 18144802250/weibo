//
//  WRUserTool.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/27.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "BaseNetManager.h"
#import "UserResult.h"
#import "StatusModel.h"

@interface WRUserTool : BaseNetManager

+ (void)unreadWithCompletionHandle:(void(^)(UserResult *result, NSError *error))complete;

+ (void)userInfoWithCompletionHandle:(void(^)(StatusUserModel *result, NSError *error))complete;

@end
