//
//  WRPhotosView.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/30.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "WRPhotosView.h"
#import "StatusModel.h"

@interface WRPhotosView ()

@property (nonatomic, strong) NSMutableArray *allPhotos;

@end

@implementation WRPhotosView

- (NSMutableArray *)allPhotos {
    if(_allPhotos == nil) {
        _allPhotos = [[NSMutableArray alloc] init];
    }
    return _allPhotos;
}

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
        
        iv.contentMode = UIViewContentModeScaleAspectFill;
        
        iv.clipsToBounds = YES;
        
        [self.allPhotos addObject:iv];
        
        [self addSubview:iv];
    }
}

- (void)setPhotosUrl:(NSArray *)photosUrl
{
    _photosUrl = photosUrl;
    
    [self setUpData];
    
    [self setUpFrame];
}

- (void)setUpData
{
    int count = (int)self.allPhotos.count;
    for (int i = 0; i < count; i++) {
        UIImageView *iv = self.allPhotos[i];
        if (i < _photosUrl.count) {
            iv.hidden = NO;
            StatusPicUrlsModel *pic = _photosUrl[i];
            [iv setImageWithURL:pic.thumbnailPic];
        } else {
            iv.hidden = YES;
        }
        
    }
}

- (void)setUpFrame
{
    CGFloat iconX = 0;
    CGFloat iconY = 0;
    CGFloat iconWH = 75;
    CGFloat margin = 10;
    int cols = self.photosUrl.count==4?2:3;
    int count = (int)self.photosUrl.count;
    for (int i = 0; i < count; i++) {
        
        //当前列
        int col = i % cols;
        //当前行
        int row = i / cols ;
        iconX = iconWH * (col + margin);
        iconY = iconWH * (row + margin);
        UIImageView *iv = self.allPhotos[i];
        iv.backgroundColor = [UIColor whiteColor];
        iv.frame = CGRectMake(iconX, iconY, iconWH, iconWH);
    }
}



@end
