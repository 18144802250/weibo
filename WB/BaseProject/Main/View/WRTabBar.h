//
//  WRTabBar.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/8.
//  Copyright (c) 2015年 apple-jd28. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WRTabBar;

@protocol WRTabBarDelegate <NSObject>

@optional

- (void)tabBar:(WRTabBar*)tabBar didClickButton:(NSInteger)index;

@end

@interface WRTabBar : UIView

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) id<WRTabBarDelegate> delegate;

@end
