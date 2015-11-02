//
//  WRSearchBar.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/14.
//  Copyright (c) 2015年 apple-jd28. All rights reserved.
//

#import "WRSearchBar.h"

@implementation WRSearchBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.font = [UIFont systemFontOfSize:13];
        
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        
        UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        
        imageV.width += 10;
        imageV.contentMode = UIViewContentModeCenter;
        
        self.leftView = imageV;
        
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

@end
