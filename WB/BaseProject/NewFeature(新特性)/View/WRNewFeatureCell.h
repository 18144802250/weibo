//
//  WRNewFeatureCell.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/19.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WRNewFeatureCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

- (void)isLastPageWithIndexPath:(NSIndexPath*)indexPath count:(int)count;

@end
