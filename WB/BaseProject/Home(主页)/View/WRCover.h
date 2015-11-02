//
//  WRCover.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/14.
//  Copyright (c) 2015年 apple-jd28. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WRCover;
@protocol WRCoverDelegate <NSObject>

@optional
-(void)coverDidClickCover:(WRCover *)cover;

@end

@interface WRCover : UIView

+ (instancetype)show;

@property (nonatomic, assign) BOOL dimBackground;

@property (nonatomic, weak) id<WRCoverDelegate> delegate;

@end
