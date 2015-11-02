//
//  WRTabBar.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/8.
//  Copyright (c) 2015年 apple-jd28. All rights reserved.
//

#import "WRTabBar.h"
#import "WRTabBarButton.h"

@interface WRTabBar ()

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UIButton *selectButton;

@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation WRTabBar

-(NSMutableArray *)buttons
{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

-(void)setItems:(NSArray *)items
{
    _items = items;
    
    for (UITabBarItem *item in items) {
        WRTabBarButton *button = [WRTabBarButton buttonWithType:UIButtonTypeCustom];
        button.item = item;
        
        button.tag = self.buttons.count;
        
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        if (button.tag == 0) {
            [self btnClick:button];
        }
        
        [self addSubview:button];
        
        [self.buttons addObject:button];
    }
}

- (void)btnClick:(UIButton*)button
{
    _selectButton.selected = NO;
    button.selected = YES;
    _selectButton = button;
    
    if ([_delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
        [_delegate tabBar:self didClickButton:button.tag];
    }
}

-(UIButton *)button
{
    if (!_button) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [btn sizeToFit];
        
        _button = btn;
        
        [self addSubview:_button];
    }
    return _button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat itemX = 0;
    CGFloat itemY = 0;
    CGFloat itemW = w / (self.items.count+1);
    CGFloat itemH = h;
    
    int i = 0;
    for (UIView *tabbarButton in self.buttons) {
        
        if (i == 2) {
            i = 3;
        }
        itemX = i*itemW;
        tabbarButton.frame = CGRectMake(itemX, itemY, itemW, itemH);
        i++;
    
        
    }
    self.button.center = CGPointMake(w*0.5, h*0.5);
}


@end
