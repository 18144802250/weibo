


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
    UIImageView *iv = [[UIImageView alloc] initWithImage:photo];
    [self addSubview:iv];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = (int)self.subviews.count;
    
    NSLog(@"%d",count);
    
    CGFloat margin = 10;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat wh = (kWindowW - 4 *margin) / 3;
    
    for (int i = 0; i < count; i++) {
        
        UIButton *btn = self.subviews[i];
        
        int col = count % 3;
        int row = count / 3;
        
        x = margin + col * (wh + margin);
        y = margin + row * (wh + margin);
        
        btn.frame = CGRectMake(x, y, wh, wh);
    }
    
}

@end
