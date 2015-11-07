//
//  WRTabBarController.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/8.
//  Copyright (c) 2015年 apple-jd28. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WRTabBarController : UITabBarController

+ (WRTabBarController *)defaultWRTabBarController;

@property (nonatomic, getter=isUnread) BOOL unread;

@end
