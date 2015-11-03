//
//  WRStatusToolView.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/29.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "WRStatusToolView.h"
#import "WRStatusFrame.h"
#import "StatusModel.h"

@interface WRStatusToolView ()

@property (nonatomic, strong) NSMutableArray *btns;
@property (nonatomic, strong) NSMutableArray *devise;

@property (nonatomic, weak) UIButton *reweet;
@property (nonatomic, weak) UIButton *comment;
@property (nonatomic, weak) UIButton *unlike;

@end

@implementation WRStatusToolView

- (NSMutableArray *)btns {
    if(_btns == nil) {
        _btns = [[NSMutableArray alloc] init];
    }
    return _btns;
}

- (NSMutableArray *)devise {
    if(_devise == nil) {
        _devise = [[NSMutableArray alloc] init];
    }
    return _devise;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupAllChildView];
        
        self.userInteractionEnabled = YES;
        
        self.image = [UIImage imageWithStretchableName:@"timeline_card_bottom_background"];
    }
    return self;
}

- (void)setupAllChildView
{
    _reweet = [self setUpOneBtnWithTitle:@"转发" image:[UIImage imageNamed:@"timeline_icon_comment"]];
    
    _comment = [self setUpOneBtnWithTitle:@"评论" image:[UIImage imageNamed:@"timeline_icon_retweet"]];
    
    _unlike = [self setUpOneBtnWithTitle:@"赞" image:[UIImage imageNamed:@"timeline_icon_unlike"]];
    
    [self setUpDevices];
}

- (void)setUpDevices
{
    for (int i = 0; i < 2; i++) {
        UIImageView *devices = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
        [self addSubview:devices];
        [self.devise addObject:devices];
    }
}

- (UIButton *)setUpOneBtnWithTitle:(NSString*)title image:(UIImage*)image
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_background_highlighted"] forState:UIControlStateHighlighted];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    
    [self.btns addObject:btn];
    [self addSubview:btn];
    return btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.btns.count;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = WRScreenW / count;
    CGFloat btnH = self.higth;
    
    for (int i = 0; i < count; i++) {
        UIButton *button = self.btns[i];
        btnX = btnW * i * 1.0;
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
    for (int i = 0; i < count -1; i++) {
        UIButton *button = self.btns[i+1];
        UIImageView *iv = self.devise[i];
        iv.x = button.x;
    }
    
}

- (void)setToolFrame:(WRStatusFrame *)toolFrame
{
    _toolFrame = toolFrame;
    
    StatusStatusesModel *status = _toolFrame.statuses;
    // 转发
    [self setTitleWithControl:_reweet count:status.reposts_count originTitle:@"转发"];
    // 评论
    [self setTitleWithControl:_comment count:status.comments_count originTitle:@"评论"];
    // 赞
    [self setTitleWithControl:_unlike count:status.attitudes_count originTitle:@"赞"];
}

- (void)setTitleWithControl:(UIButton*)button count:(CGFloat)count originTitle:(NSString *)originTitle
{
    NSString *title = nil;
  
    if (count) {
        if (count > 10000) {
            title = [NSString stringWithFormat:@"%.1lf万",count/10000];
        } else {
            title = [NSString stringWithFormat:@"%.1lf",count];
        }
        title = [title stringByReplacingOccurrencesOfString:@".0" withString:@""];
        [button setTitle:title forState:UIControlStateNormal];
    } else {
        [button setTitle:originTitle forState:UIControlStateNormal];
    }
    
}

@end
