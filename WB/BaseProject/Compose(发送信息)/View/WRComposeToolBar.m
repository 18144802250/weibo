//
//  WRComposeToolBar.m
//  BaseProject
//
//  Created by apple-jd28 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WRComposeToolBar.h"

@implementation WRComposeToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpToolBar];
    }
    return self;
}

- (void)setUpToolBar
{
    // 相册
    [self setUpOneToolBarWithImage:[UIImage imageNamed:@"compose_toolbar_picture"] hightlightImage:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"]];
    // 提及
    [self setUpOneToolBarWithImage:[UIImage imageNamed:@"compose_toolbar_picture"] hightlightImage:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"]];
    // 话题
    [self setUpOneToolBarWithImage:[UIImage imageNamed:@"compose_toolbar_picture"] hightlightImage:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"]];
    // 表情
    [self setUpOneToolBarWithImage:[UIImage imageNamed:@"compose_toolbar_picture"] hightlightImage:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"]];
    // 键盘
    [self setUpOneToolBarWithImage:[UIImage imageNamed:@"compose_toolbar_picture"] hightlightImage:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"]];
    
}

- (void)setUpOneToolBarWithImage:(UIImage*)image hightlightImage:(UIImage*)hImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:hImage
         forState:UIControlStateHighlighted];
    btn.tag = self.subviews.count;
    
    [btn bk_addEventHandler:^(id sender) {
        
        if ([_delegate respondsToSelector:@selector(didClickedOnToolBtn:)]) {
            [_delegate didClickedOnToolBtn:btn];
        }
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self addSubview:btn];
    
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = kWindowW / count;
    CGFloat h = self.higth;
    
    for (int i = 0; i < count; i++) {

        UIButton *btn = self.subviews[i];
        
        x = i * w;
        
        btn.frame = CGRectMake(x, y, w, h);
    }
}

@end
