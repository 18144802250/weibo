//
//  BaseNetManager.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/24.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "BaseNetManager.h"

static AFHTTPRequestOperationManager *manager = nil;

@implementation BaseNetManager

+ (AFHTTPRequestOperationManager*) shareAFManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain", nil];
    });
    return manager;
}

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completeHandle:(void (^)(id, NSError *))complete
{
    return [[self shareAFManager] GET:path parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {

        complete(responseObject,nil);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        complete(nil,error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completeHandle:(void (^)(id, NSError *))complete
{
    return [[self shareAFManager] POST:path parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        complete(responseObject,nil);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        complete(nil,error);
    }];
}

@end
