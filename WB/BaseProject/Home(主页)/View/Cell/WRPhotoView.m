//
//  WRPhotoView.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/30.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "WRPhotoView.h"
#import "StatusModel.h"

@interface WRPhotoView ()

@property (nonatomic, weak) UIImageView *gifView;

@end

@implementation WRPhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        
        UIImageView *gifView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_image_gif"]];
        [self addSubview:gifView];
        _gifView = gifView;
        
    }
    return self;
}

- (void)setPhoto:(StatusPicUrlsModel *)photo
{
    _photo = photo;
    
    [self sd_setImageWithURL:photo.thumbnailPic];
//    [self setImageWithURL:photo.thumbnailPic placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    NSString *urlStr = photo.thumbnailPic.absoluteString;
    if ([urlStr hasSuffix:@".gif"]) {
        _gifView.hidden = NO;
    } else {
        _gifView.hidden = YES;
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.x = self.x - self.gifView.width;
    self.gifView.y = self.y = self.gifView.higth;
}

@end
