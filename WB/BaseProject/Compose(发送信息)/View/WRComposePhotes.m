


//
//  WRComposePhotes.m
//  BaseProject
//
//  Created by apple-jd28 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WRComposePhotes.h"

@implementation WRComposePhotes

- (void)setPhoto:(UIImage *)photo
{
    _photo = photo;
    UIImageView *iv = [[UIImageView alloc] init];
    iv.image = photo;
    [self addSubview:iv];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = (int)self.subviews.count;

    
    CGFloat margin = 10;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat wh = (kWindowW - 4 *margin) / 3;
    
    for (int i = 0; i < count; i++) {
        
        UIImageView *iv = self.subviews[i];
        
        int col = i % 3;
        int row = i / 3;
        
        x = margin + col * (wh + margin);
        y = margin + row * (wh + margin);
        
        iv.frame = CGRectMake(x, y, wh, wh);
    }
    
}

@end
