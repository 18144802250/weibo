//
//  WRPhotosView.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/30.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "WRPhotosView.h"
#import "WRPhotoView.h"
#import "StatusModel.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"

@interface WRPhotosView ()


@end

@implementation WRPhotosView

- (instancetype)initWithFrame:(CGRect)frame
{
 
    if (self = [super initWithFrame:frame]) {
        
        [self addPhotos];
        
    }
    return self;
}





- (void)addPhotos
{
    for (int i = 0; i < 9; i ++) {
        UIImageView *iv = [UIImageView new];
        
        iv.tag = i;
        
        iv.userInteractionEnabled = YES;
        
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.clipsToBounds = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        
        [iv addGestureRecognizer:tap];
        
        [self addSubview:iv];
    }
}

- (void)tap:(UITapGestureRecognizer*)tap
{
    UIImageView *iv = (UIImageView*)tap.view;
    
    NSMutableArray *mjArr = [NSMutableArray new];
    
    int i = 1;
    for (StatusPicUrlsModel *pv in _photosUrl) {
        NSString *urlStr = pv.thumbnailPic.absoluteString;
        urlStr = [urlStr stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        MJPhoto *photo = [MJPhoto new];
        
        photo.url = [NSURL URLWithString:urlStr];
        photo.index = i;
        photo.srcImageView = iv;
        
        [mjArr addObject:photo];
        i++;
    }
    
    MJPhotoBrowser *photoBrowser = [[MJPhotoBrowser alloc] init];
    photoBrowser.photos = mjArr;
    photoBrowser.currentPhotoIndex = iv.tag;
    
    [photoBrowser show];
    
}

- (void)setPhotosUrl:(NSArray *)photosUrl
{
    _photosUrl = photosUrl;
    
    [self setUpData];
    
    
    
}

- (void)setUpData
{
    CGFloat iconX = 0;
    CGFloat iconY = 0;
    CGFloat iconWH = 70;
    CGFloat margin = 10;
    
    int cols = _photosUrl.count==4?2:3;
    int pcount = (int)_photosUrl.count;
    
    int count = (int)self.subviews.count;
    for (int i = 0; i < count; i++) {
        UIImageView *iv = self.subviews[i];
        if (i < pcount) {
            iv.hidden = NO;
            
            StatusPicUrlsModel *pic = _photosUrl[i];
//
//            iv.photo = pic;
//            [iv setImage:[UIImage imageNamed:@"near"]];
            
            [iv setImageWithURL:pic.thumbnailPic placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
            
            NSString *urlStr = pic.thumbnailPic.absoluteString;
            if ([urlStr hasSuffix:@".gif"]) {
                UIImageView *gifView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_image_gif"]];
                [iv addSubview:gifView];
                [gifView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.bottom.mas_equalTo(0);
                }];
            }
            
            
            //当前列
            int col = i % cols;
            //当前行
            int row = i / cols ;
            iconX = col * (iconWH + margin);
            iconY = row * (iconWH + margin);
            iv.frame = CGRectMake(iconX, iconY, iconWH, iconWH);
            
        } else {
            iv.hidden = YES;
        }
        
    }
}
/*
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat iconX = 0;
    CGFloat iconY = 0;
    CGFloat iconWH = 70;
    CGFloat margin = 10;
    int cols = _photosUrl.count==4?2:3;
    int count = (int)_photosUrl.count;
    for (int i = 0; i < count; i++) {
        //当前列
        int col = i % cols;
        //当前行
        int row = i / cols ;
        iconX = col * (iconWH + margin);
        iconY = row * (iconWH + margin);
        WRPhotoView *iv = self.subviews[i];
        iv.frame = CGRectMake(iconX, iconY, iconWH, iconWH);
    }
    
}
*/




@end
