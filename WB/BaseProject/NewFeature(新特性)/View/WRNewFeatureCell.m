//
//  WRNewFeatureCell.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/19.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "WRNewFeatureCell.h"
#import "WRTabBarController.h"

@interface WRNewFeatureCell ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *shareBtn;

@property (nonatomic, strong) UIButton *beginBtn;

@end

@implementation WRNewFeatureCell

- (UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageView = [UIImageView new];
        _imageView = imageView;
        [self.contentView addSubview:imageView];
    }
    return _imageView;
}

- (UIButton *)shareBtn
{
    if (!_shareBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"分享给大家" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        
        [btn sizeToFit];
        
        _shareBtn = btn;
        
        [self.contentView addSubview:btn];
    }
    return _shareBtn;
}

- (UIButton *)beginBtn
{
    if (!_beginBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:@"开始微博" forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateSelected];
        [btn sizeToFit];
        
        [btn addTarget:self action:@selector(beginClick) forControlEvents:UIControlEventTouchUpInside];
        
        _beginBtn =btn;
        [self.contentView addSubview:btn];
    }
    return _beginBtn;
}

- (void)isLastPageWithIndexPath:(NSIndexPath *)indexPath count:(int)count
{
    if (indexPath.row == count - 1) {
        self.shareBtn.hidden = NO;
        self.beginBtn.hidden = NO;
    } else {
        self.shareBtn.hidden = YES;
        self.beginBtn.hidden = YES;
    }
}

-(void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}

- (void)beginClick
{
    WRTabBarController *vc = [[WRTabBarController alloc] init];
    
    WRKeyWindow.rootViewController = vc;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    
    self.shareBtn.center = CGPointMake(self.width * 0.5, self.higth * 0.8);
    
    self.beginBtn.center = CGPointMake(self.width * 0.5, self.higth *0.9);
}

@end
