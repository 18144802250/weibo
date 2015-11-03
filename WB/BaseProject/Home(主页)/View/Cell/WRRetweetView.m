//
//  WRRetweetView.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/29.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "WRRetweetView.h"

#import "WRStatusFrame.h"
#import "StatusModel.h"
#import "WRPhotosView.h"
#import "UIImage+Extension.h"

@interface WRRetweetView ()

// 昵称
@property (nonatomic, weak) UILabel *nameView;
// 正文
@property (nonatomic, weak) UILabel *textView;
// 配图
@property (nonatomic, weak) WRPhotosView *photosView;
@end

@implementation WRRetweetView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupAllChildView];
        
        self.backgroundColor = [UIColor lightGrayColor];
    
    }
    return self;
}

- (void)setupAllChildView
{
    // 昵称
    UILabel *nameView = [[UILabel alloc] init];
    nameView.textColor = [UIColor blueColor];
    nameView.font = [UIFont systemFontOfSize:WRNameFontSize];
    [self addSubview:nameView];
    _nameView = nameView;
    
    
    // 正文
    UILabel *textView = [[UILabel alloc] init];
    textView.font = [UIFont systemFontOfSize:WRTextFontSize];
    textView.numberOfLines = 0;
    textView.textColor = [UIColor blackColor];
    [self addSubview:textView];
    _textView = textView;
    
    // 配图
    WRPhotosView *photosView = [[WRPhotosView alloc] init];
    [self addSubview:photosView];
    _photosView = photosView;
}

- (void)setRetFrame:(WRStatusFrame *)retFrame
{
    _retFrame = retFrame;
    NSLog(@"retName3 = %@",retFrame.statuses.retweetName);
    [self setUpData];
    
    [self setUpFrame];
}

- (void)setUpData
{
    StatusStatusesModel *retStatus = _retFrame.statuses.retweeted_status;
    // 昵称
    _nameView.text = _retFrame.statuses.retweetName;

    // 正文
    _textView.text = retStatus.text;
    NSLog(@"retName4 = %@",_retFrame.statuses.retweetName);
    
//    _photosView.photos = retStatus.pic_urls;
}

- (void)setUpFrame
{
    NSLog(@"retName5 = %@",_retFrame.statuses.retweetName);
    // 昵称
    _nameView.frame = _retFrame.retweetNameFrame;
    
    // 正文
    _textView.frame = _retFrame.retweetTextFrame;
    
//    _photosView.frame = _statusFrame.retweetPhotosFrame;
}


@end
