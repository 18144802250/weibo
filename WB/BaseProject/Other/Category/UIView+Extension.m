//
//  UIView+Extension.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/10.
//  Copyright (c) 2015年 apple-jd28. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)x
{
    return self.bounds.origin.x;
}

-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat)y
{
    return self.bounds.origin.y;
}

-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)width
{
    return self.bounds.size.width;
}

-(void)setHigth:(CGFloat)higth
{
    CGRect frame = self.frame;
    frame.size.height = higth;
    self.frame = frame;
}

-(CGFloat)higth
{
    return self.bounds.size.height;
}

@end
