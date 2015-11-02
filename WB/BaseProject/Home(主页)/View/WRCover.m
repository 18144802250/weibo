

//
//  WRCover.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/14.
//  Copyright (c) 2015年 apple-jd28. All rights reserved.
//

#import "WRCover.h"

@implementation WRCover

+(instancetype)show
{
    WRCover *cover = [[WRCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    cover.backgroundColor = [UIColor clearColor];
    
    [WRKeyWindow addSubview:cover];
    
    return cover;
}

- (void)setDimBackground:(BOOL)dimBackground
{
    _dimBackground = dimBackground;
    
    if (dimBackground) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.5;
    } else {
        self.alpha = 1;
        self.backgroundColor = [UIColor clearColor];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self removeFromSuperview];
    
    if ([_delegate respondsToSelector:@selector(coverDidClickCover:)]) {
        [_delegate coverDidClickCover:self];
    }
}

@end
