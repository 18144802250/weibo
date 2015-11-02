//
//  WRPopMenu.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/14.
//  Copyright (c) 2015年 apple-jd28. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WRPopMenu : UIImageView

+ (instancetype)showInRect:(CGRect)rect;

+ (void)hide;

@property (nonatomic, weak) UIView *contentView;

@end
