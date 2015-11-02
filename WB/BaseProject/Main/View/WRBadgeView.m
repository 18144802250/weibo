//
//  WRBadgeView.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/10.
//  Copyright (c) 2015年 apple-jd28. All rights reserved.
//

#import "WRBadgeView.h"


#define WRBadgeViewFont [UIFont systemFontOfSize:11]

@implementation WRBadgeView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = WRBadgeViewFont;
        
        [self sizeToFit];
    }
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = badgeValue;
    if (badgeValue.length == 0 || [badgeValue isEqualToString:@"0"]) {
        self.hidden = YES;
    } else {
        self.hidden = NO;
    }
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = WRBadgeViewFont;
    
    CGSize size = [badgeValue sizeWithAttributes:attr];
    
    
    if (size.width > self.width) {
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
        [self setTitle:nil forState:UIControlStateNormal];
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    } else {
        [self setImage:nil forState:UIControlStateNormal];
        [self setTitle:badgeValue forState:UIControlStateNormal];
    }
}

@end
