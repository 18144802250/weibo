//
//  WRPopMenu.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/14.
//  Copyright (c) 2015年 apple-jd28. All rights reserved.
//

#import "WRPopMenu.h"

@implementation WRPopMenu

+(instancetype)showInRect:(CGRect)rect
{
    WRPopMenu *menu = [[WRPopMenu alloc] initWithFrame:rect];
    
    menu.userInteractionEnabled = YES;
    
    menu.image = [UIImage imageWithStretchableName:@"popover_background"];
    
    [WRKeyWindow addSubview:menu];
    
    return menu;
}

+(void)hide
{
    for (UIView *popMenu in WRKeyWindow.subviews) {
        if ([popMenu isKindOfClass:self]) {
            [popMenu removeFromSuperview];
        }
    }
}

- (void)setContentView:(UIView *)contentView
{
    [_contentView removeFromSuperview];
    
    _contentView = contentView;
    
    contentView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:contentView];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat y = 9;
    CGFloat margin = 5;
    CGFloat x = margin;
    CGFloat w = self.width - 2*margin;
    CGFloat h = self.higth - y - margin;
    
    _contentView.frame = CGRectMake(x, y, w, h);
}

@end
