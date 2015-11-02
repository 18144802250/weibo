//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"

#import "WRAccount.h"
#import "WRQAuthViewController.h"
#import "WRAccountTool.h"
#import "WRRootTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //判断是否授权
    if ([WRAccountTool account]) {
        //选择根控制器 判断是否进入欢迎页面
        [WRRootTool choiceRootVCWithWindow:self.window];
    } else {
        
        WRQAuthViewController *vc = [WRQAuthViewController new];
        self.window.rootViewController = vc;
    }
    
    [self.window makeKeyAndVisible];

    return YES;
}

@end
