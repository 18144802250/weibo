//
//  WRComposeTool.h
//  BaseProject
//
//  Created by apple-jd28 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNetManager.h"


@interface WRComposeTool : BaseNetManager

+ (void)postComposeWithInfo:(NSArray*)info completionHandle:(void(^)(id resposeObj,NSError *error))completion;

@end
