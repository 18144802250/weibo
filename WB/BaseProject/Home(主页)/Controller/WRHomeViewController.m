//
//  WRHomeViewController.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/14.
//  Copyright (c) 2015年 apple-jd28. All rights reserved.
//

#import "WRHomeViewController.h"
#import "WROneViewController.h"
#import "UIBarButtonItem+item.h"

#import "WRTitleButton.h"
#import "WRPopMenu.h"
#import "WRCover.h"

#import "WRUserTool.h"
#import "WRAccountTool.h"
#import "StatusViewModel.h"

#import "StatusCell.h"

@interface WRHomeViewController () <WRCoverDelegate>

@property (nonatomic, strong) WRTitleButton *titleButton;

@property (nonatomic, strong) WROneViewController *one;

@property (nonatomic, strong) StatusViewModel *statusVM;

@end

@implementation WRHomeViewController

- (StatusViewModel *)statusVM
{
    if (!_statusVM) {
        _statusVM = [StatusViewModel new];
    }
    return _statusVM;
}

-(WROneViewController *)one
{
    if (!_one) {
        _one = [WROneViewController new];
    }
    return _one;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    
    [self setUpNavigationTabBar];
//获取微博数据
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.statusVM getNewWithCompleteHandle:^(NSError *error) {
            
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
            [self showNewstatuesCount:self.statusVM.count];
        }];
    }];
    
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.statusVM getMoreWithCompleteHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }];
    }];
    
    [WRUserTool userInfoWithCompletionHandle:^(StatusUserModel *result, NSError *error) {
        
        NSString *title = [WRAccountTool account].name?[WRAccountTool account].name:@"首页";
        
        [self.titleButton setTitle:title forState:UIControlStateNormal];
        
        WRAccount *account = [WRAccountTool account];
        account.name = result.name;
        
        [WRAccountTool saveAccount:account];
    }];
}

- (void)showNewstatuesCount:(NSInteger)count
{
    CGFloat labelX = 0;
    CGFloat labelH = 35;
    CGFloat labelY = CGRectGetMaxY(self.navigationController.navigationBar.frame) - labelH;
    CGFloat labelW = self.view.width;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelW, labelH)];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"最新微博数%ld",count];
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    [UIView animateWithDuration:0.25 animations:^{
        label.transform = CGAffineTransformMakeTranslation(0, labelH);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.25 delay:2.0 options:UIViewAnimationOptionCurveLinear animations:^{
            label.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
    
}

//设置导航栏
- (void)setUpNavigationTabBar
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] hightImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] taget:self action:@selector(friendSearch) forControlEven:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_pop"] hightImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] taget:self action:@selector(pop) forControlEven:UIControlEventTouchUpInside];
    
    WRTitleButton *titleButton = [WRTitleButton buttonWithType:UIButtonTypeCustom];
    
    _titleButton = titleButton;
    
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    
    titleButton.adjustsImageWhenHighlighted = NO;
    
    [titleButton addTarget:self action:@selector(clickTitleButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleButton;
}
/**
 *  点击首页
 */
- (void)clickTitleButton:(UIButton *)button
{
    button.selected = !button.selected;
    
    WRCover *cover = [WRCover show];
    cover.delegate = self;
    
    CGFloat popW = 200;
    CGFloat popX = (self.view.width - 200) * 0.5;
    CGFloat popH = popW;
    CGFloat popY = 55;
    
    WRPopMenu *menu = [WRPopMenu showInRect:CGRectMake(popX, popY, popW, popH)];
    menu.contentView = self.one.view;
}

#pragma mark - 蒙版代理方法实现
-(void)coverDidClickCover:(WRCover *)cover
{
    [WRPopMenu hide];
    
    _titleButton.selected = NO;
}

//左边BarButtonItem的方法
- (void)friendSearch
{
    NSLog(@"ffff");
}
//右边BarButtonItem的方法
- (void)pop
{
    WROneViewController *vc = [WROneViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Table view data source

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.statusVM.rowNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StatusCell *cell = [StatusCell CellWithTableView:tableView];
    
    WRStatusFrame *statusFrame = self.statusVM.frameArr[indexPath.section];
    
    cell.statusFrame = statusFrame;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    WRStatusFrame *statusF = self.statusVM.frameArr[indexPath.section];
    return statusF.cellHeight;

}

#pragma mark -代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
