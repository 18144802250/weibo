//
//  StatusNetManager.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/26.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "BaseNetManager.h"

typedef NS_ENUM(NSUInteger, StatusParamType) {
    StatusParamTypeNew,
    StatusParamTypeMore
};

@interface StatusNetManager : BaseNetManager

+ (id)getStatusWithStatusParamType:(StatusParamType)type typeID:(NSString*)typeID completeHandle:(void(^)(StatusModel *model, NSError *error))complete;

@end
