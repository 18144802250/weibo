//
//  WRComposeToolBar.h
//  BaseProject
//
//  Created by apple-jd28 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>


@class WRComposeToolBar;
@protocol WRComposeToolBarDelegate <NSObject>

@optional
/**
 *  点击工具按钮
 */
- (void)didClickedOnToolBtn:(UIButton*)button;

@end


@interface WRComposeToolBar : UIView

@property (nonatomic, strong) id<WRComposeToolBarDelegate> delegate;

@end
