//
//  WRRootTool.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/23.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "WRRootTool.h"
#import "WRTabBarController.h"
#import "WRNewFeatureViewController.h"



@implementation WRRootTool

+(void)choiceRootVCWithWindow:(UIWindow *)window
{
    NSString *currenVension = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    NSString *lastVension = [[NSUserDefaults standardUserDefaults] objectForKey:WRVensionKey];
    
    if (![currenVension isEqualToString:lastVension] || !lastVension) {
        
        WRNewFeatureViewController *vc = [[WRNewFeatureViewController alloc] init];
        
        window.rootViewController = vc;
        
        [[NSUserDefaults standardUserDefaults] setObject:currenVension forKey:WRVensionKey];
        
    } else {
        WRTabBarController *tc = [WRTabBarController new];
        
        window.rootViewController = tc;
        
    }
}

@end
