//
//  StatusCell.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/27.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "StatusCell.h"
#import "WROriginalView.h"
#import "WRRetweetView.h"
#import "WRStatusToolView.h"

#import "WRStatusFrame.h"
#import "StatusModel.h"


@interface StatusCell ()

@property (nonatomic, strong) WROriginalView *originalView;
@property (nonatomic, strong) WRRetweetView *retweetView;
@property (nonatomic, strong) WRStatusToolView *toolView;

@end


@implementation StatusCell

+ (instancetype)CellWithTableView:(UITableView *)tableView
{
    static NSString *identify = @"Cell";
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[StatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
        
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupAllChildView];
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

- (void)setupAllChildView
{
    WROriginalView *originalView = [WROriginalView new];
    [self.contentView addSubview:originalView];
    _originalView = originalView;
    
    WRRetweetView *retweetView = [WRRetweetView new];
    [self.contentView addSubview:retweetView];
    _retweetView = retweetView;
    
    WRStatusToolView *toolView = [WRStatusToolView new];
    [self.contentView addSubview:toolView];
    toolView.backgroundColor = [UIColor blueColor];
    _toolView = toolView;
}

- (void)setStatusFrame:(WRStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    _originalView.frame = statusFrame.originalViewFrame;
    _originalView.originFrame = statusFrame;
    
    NSLog(@"retName1 = %@",statusFrame.statuses.retweetName);
    
    if (statusFrame.statuses.retweeted_status) {
        
        NSLog(@"retName2 = %@",statusFrame.statuses.retweetName);
        
        _retweetView.retFrame = statusFrame;
        _retweetView.frame = statusFrame.retweetViewFrame;
        _retweetView.hidden = NO;
    } else {
        _retweetView.hidden = YES;
    }
    
    
    _toolView.frame = statusFrame.toolBarFrame;
    _toolView.toolFrame = statusFrame;
}


@end
