//
//  WRTabBarController.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/8.
//  Copyright (c) 2015年 apple-jd28. All rights reserved.
//

#import "WRTabBarController.h"
#import "WRNavigationController.h"

#import "WRHomeViewController.h"
#import "WRMessageViewController.h"
#import "WRDiscoverViewController.h"
#import "WRProfileViewController.h"
#import "ComposeViewController.h"

#import "WRTabBar.h"
#import "WRUserTool.h"


static WRTabBarController *tbC = nil;

@interface WRTabBarController () <WRTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, strong) WRHomeViewController *homeVC;
@property (nonatomic, strong) WRMessageViewController *messageVC;
@property (nonatomic, strong) WRProfileViewController *profileVC;



@end

@implementation WRTabBarController

-(NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewC];
    
    [self setUpTabbar];
    
//    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(unreadMessage) userInfo:nil repeats:YES];
}

- (void)unreadMessage
{
    [WRUserTool unreadWithCompletionHandle:^(UserResult *result, NSError *error) {
        _homeVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.status];
        _messageVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.messageCount];
        _profileVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.follower];
        _homeVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",result.status];
        
        [UIApplication sharedApplication].applicationIconBadgeNumber = result.totalCount;
        _unread = result.status;
    }];
}

- (void)setUpTabbar
{
    WRTabBar *tabBar = [[WRTabBar alloc] initWithFrame:self.tabBar.bounds];
    
    tabBar.backgroundColor = [UIColor whiteColor];
    
    tabBar.delegate = self;
    
    tabBar.items = self.items;
    
    tabBar.center = self.tabBar.center;
    
    [self.view addSubview:tabBar];
    
}

#pragma mark - WRTabBar代理方法
- (void)tabBar:(WRTabBar *)tabBar didClickButton:(NSInteger)index
{
    
    if (index == self.selectedIndex && index == 0) {
        [_homeVC refreshHome];
    }
    
    self.selectedIndex = index;
}

- (void)didClickCenterButton:(UIButton *)button
{
    ComposeViewController *vc = [ComposeViewController new];
    
    WRNavigationController *navi = [[WRNavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:navi animated:YES completion:nil];
    
}


- (void) addChildViewC
{
    WRHomeViewController *homeVC = [[WRHomeViewController alloc] init];
    [self setChildViewC:homeVC title:@"首页" image:[UIImage imageNamed:@"tabbar_home"] selectImage:[UIImage imageWithOriginalName:@"tabbar_home_selected"]];
    _homeVC = homeVC;
    
    WRMessageViewController *messageVC = [[WRMessageViewController alloc] init];
    [self setChildViewC:messageVC title:@"消息" image:[UIImage imageNamed:@"tabbar_message_center"    ] selectImage:[UIImage imageWithOriginalName:@"tabbar_message_center_selected"]];
    _messageVC = messageVC;
    
    WRDiscoverViewController *discoverVC = [[WRDiscoverViewController alloc] init];
    [self setChildViewC:discoverVC title:@"发现" image:[UIImage imageNamed:@"tabbar_discover"]selectImage:[UIImage imageWithOriginalName:@"tabbar_discover_selected"]];
    
    
    WRProfileViewController *profileVC = [[WRProfileViewController alloc] init];
    [self setChildViewC:profileVC title:@"我" image:[UIImage imageNamed:@"tabbar_profile"] selectImage:[UIImage imageWithOriginalName:@"tabbar_profile_selected"]];
    _profileVC = profileVC;
}

- (void) setChildViewC:(UIViewController*)vc title:(NSString*)title image:(UIImage*)image selectImage:(UIImage*)selectImage
{
    vc.title = title;
    
    vc.tabBarItem.image = image;
    
    vc.tabBarItem.selectedImage = selectImage;
    
    [self.items addObject:vc.tabBarItem];
    
    WRNavigationController *navi = [[WRNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:navi];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    for (UIView *item in self.tabBar.subviews) {
        if ([item isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [item removeFromSuperview];
        }
    }
}



#pragma mark -获取唯一的tabbarController  用于使用改控制器的值
+ (instancetype)defaultWRTabBarController
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tbC = [WRTabBarController new];
    });
    return tbC;
}

@end
