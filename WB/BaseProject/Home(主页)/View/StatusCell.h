//
//  StatusCell.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/27.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import <UIKit/UIKit.h>


@class WRStatusFrame;
@interface StatusCell : UITableViewCell

@property (nonatomic, strong) WRStatusFrame *statusFrame;

+ (instancetype)CellWithTableView:(UITableView*)tableView;

@end
