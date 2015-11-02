//
//  WRNavigationController.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/10.
//  Copyright (c) 2015年 apple-jd28. All rights reserved.
//

#import "WRNavigationController.h"
#import "UIBarButtonItem+item.h"

@interface WRNavigationController () <UINavigationControllerDelegate>

@property (nonatomic, strong) id popDelegate;

@end

@implementation WRNavigationController 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.delegate = self;
    
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    
    self.interactivePopGestureRecognizer.delegate = nil;
}

+(void)initialize
{
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [item setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
}

#pragma mark 导航控制器代理  设置当回到主控制器时的方法

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UITabBarController *tabCV =  (UITabBarController *)WRKeyWindow.rootViewController;
    
    for (UIView *tabBarButton in tabCV.tabBar.subviews) {
        [tabBarButton removeFromSuperview];
    }
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        //左边
//        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_back"] hightImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] taget:self action:@selector(popToPre) forControlEven:UIControlEventTouchUpInside];
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_more"] hightImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] taget:self action:@selector(popToRoot) forControlEven:UIControlEventTouchUpInside];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)popToPre {
    [self popViewControllerAnimated:YES];
}

- (void)popToRoot {
    [self popToRootViewControllerAnimated:YES];
}

@end
