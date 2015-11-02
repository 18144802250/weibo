//
//  WRPhotosView.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/30.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WRStatusFrame;
@interface WRPhotosView : UIView

@property (nonatomic, strong) NSArray *photos;

@property (nonatomic, strong) WRStatusFrame *statusFrame;
@end
