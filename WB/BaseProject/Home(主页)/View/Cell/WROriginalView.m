//
//  WROriginalView.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/29.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "WROriginalView.h"
#import "WRPhotosView.h"
#import "WRStatusFrame.h"
#import "StatusModel.h"
#import "NSString+WR.h"
#import "UIImage+Extension.h"


@interface WROriginalView ()

// 头像
@property (nonatomic, weak) UIImageView *iconView;
// 昵称
@property (nonatomic, weak) UILabel *nameView;
// vip
@property (nonatomic, weak) UIImageView *vipView;
// 时间
@property (nonatomic, weak) UILabel *timeView;
// 来源
@property (nonatomic, weak) UILabel *sourceView;
// 正文
@property (nonatomic, weak) UILabel *textView;
// 配图
@property (nonatomic, weak) WRPhotosView *photosView;

@end

@implementation WROriginalView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupAllChildView];
        
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageWithStretchableName:@"timeline_card_top_background"];
    }
    return self;
}

- (void)setupAllChildView
{
    // 头像
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    _iconView = iconView;
    
    // 昵称
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = [UIFont systemFontOfSize:WRNameFontSize];
    [self addSubview:nameView];
    _nameView = nameView;
    
    // vip
    UIImageView *vipView = [[UIImageView alloc] init];
    [self addSubview:vipView];
    _vipView = vipView;
    
    // 时间
    UILabel *timeView = [[UILabel alloc] init];
    timeView.font = WRTimeFont;
    timeView.textColor = [UIColor orangeColor];
    [self addSubview:timeView];
    _timeView = timeView;
    
    // 来源
    UILabel *sourceView = [[UILabel alloc] init];
    sourceView.font = WRTimeFont;
    sourceView.textColor = [UIColor lightGrayColor];
    [self addSubview:sourceView];
    _sourceView = sourceView;
    
    // 正文
    UILabel *textView = [[UILabel alloc] init];
    textView.font = [UIFont systemFontOfSize:WRTextFontSize];
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
    
//     配图
    WRPhotosView *photosView = [[WRPhotosView alloc] init];
    photosView.backgroundColor = [UIColor redColor];
    [self addSubview:photosView];
    _photosView = photosView;
    
}

- (void)setOriginFrame:(WRStatusFrame *)originFrame
{
    _originFrame = originFrame;
    
    
    [self setUpData];
    
    [self setUpFrame];
}

- (void)setUpData
{
    StatusStatusesModel *status = _originFrame.statuses;
    // 头像
    [_iconView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    // 昵称
    if (status.user.vip) {
        _nameView.textColor = [UIColor redColor];
    }else{
        _nameView.textColor = [UIColor blackColor];
    }
    _nameView.text = status.user.name;
    // vip
    
    NSString *vipName = [NSString stringWithFormat:@"common_icon_membership_level%d",status.user.mbrank];
    _vipView.image = [UIImage imageNamed:vipName];
    // 时间
    _timeView.text = status.created_at;
    // 来源
    _sourceView.text = status.source;
    // 正文
    _textView.text = status.text;
    
//    _photosView.photos = status.pic_urls;
}

- (void)setUpFrame
{
    // 头像
    _iconView.frame = _originFrame.originalIconFrame;
    // 昵称
    _nameView.frame = _originFrame.originalNameFrame;
    
    // vip
    if (_originFrame.statuses.user.vip) { // 是vip
        
        _vipView.hidden = NO;
        _vipView.frame = _originFrame.originalVipFrame;
        
    }else{
        _vipView.hidden = YES;
        
    }
    //时间
    CGFloat timeX = CGRectGetMaxX(_originFrame.originalIconFrame) + WRStatusCellMargin;
    CGFloat timeY = CGRectGetMaxY(_originFrame.originalNameFrame) + WRStatusCellMargin * 0.5;
    CGSize timeSize = [_originFrame.statuses.created_at textSizeWithFontSize:WRTimeFontSize contraintSize:WRNameConstraintSize];
    _timeView.frame = CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    
    // 来源
    CGFloat sourceX = CGRectGetMaxX(_timeView.frame) + WRStatusCellMargin;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [_originFrame.statuses.source textSizeWithFontSize:WRTimeFontSize contraintSize:WRNameConstraintSize];
    _sourceView.frame = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    // 正文
    _textView.frame = _originFrame.originalTextFrame;
    
    //配图
    _photosView.frame = _originFrame.originalPhotosFrame;
}

@end
