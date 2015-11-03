
//
//  WRStatusFrame.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/29.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "WRStatusFrame.h"
#import "StatusModel.h"
#import "NSString+WR.h"

@implementation WRStatusFrame

- (void)setStatuses:(StatusStatusesModel *)statuses
{
    _statuses = statuses;
    
    [self setUpOriginalViewFrame];
    CGFloat toolBarY = CGRectGetMaxY(_originalViewFrame);
    
    if (statuses.retweeted_status) {
        [self setUPRetweetViewFrame];
        toolBarY = CGRectGetMaxY(_retweetViewFrame);
    }
    
    CGFloat toolX = 0;
    CGFloat toolW = WRScreenW;
    CGFloat toolH = 35;
    _toolBarFrame = CGRectMake(toolX, toolBarY, toolW, toolH);
    
    _cellHeight = CGRectGetMaxY(_toolBarFrame);
}

#pragma mark - 设置原创微博的Frame
- (void)setUpOriginalViewFrame
{
    // 头像Frame
    CGFloat iconX = WRStatusCellMargin;
    CGFloat iconY = WRStatusCellMargin;
    CGFloat iconWH = 35;
    _originalIconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
    // 昵称Frame
    CGFloat nameX = CGRectGetMaxX(_originalIconFrame) + WRStatusCellMargin;
    CGFloat nameY = WRStatusCellMargin;
    CGSize nameSize = [_statuses.user.name textSizeWithFontSize:WRNameFontSize contraintSize:WRNameConstraintSize];
    _originalNameFrame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    // vipFrame
    if (_statuses.user.isVip) {
        CGFloat vipX = CGRectGetMaxX(_originalNameFrame) + WRStatusCellMargin;
        CGFloat vipY = WRStatusCellMargin;
        CGFloat vipWH = 14;
        _originalVipFrame = CGRectMake(vipX, vipY, vipWH, vipWH);
    }
    
    // 正文Frame
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_originalIconFrame) + WRStatusCellMargin;
    CGSize textSize = [_statuses.text textSizeWithFontSize:WRTextFontSize contraintSize:WRTextConstraintSize];
    _originalTextFrame = CGRectMake(textX, textY, textSize.width, textSize.height);

    _cellHeight = CGRectGetMaxY(_originalTextFrame) + WRStatusCellMargin;
//     配图Frame
//    if (_statuses.pic_urls) {
//        CGFloat picX = WRStatusCellMargin;
//        CGFloat picY = CGRectGetMaxY(_originalTextFrame) + WRStatusCellMargin;
//        CGSize picSize = [self sizeWithPicturesCount:_statuses.pic_urls.count];
//        _originalPhotosFrame = CGRectMake(picX, picY, <#CGFloat width#>, <#CGFloat height#>)
//    }
    CGFloat originViewX = 0;
    CGFloat originViewY = 0;
    CGFloat originViewW = WRScreenW;
    CGFloat originViewH = _cellHeight;
    _originalViewFrame = CGRectMake(originViewX, originViewY, originViewW, originViewH);
    
}

//- (CGSize)sizeWithPicturesCount:(NSInteger)count
//{
////    总行数
//    int cols = round(count/3.0);
//    int rows =
//}

#pragma mark - 设置转发微博的Frame
- (void)setUPRetweetViewFrame
{
    StatusStatusesModel *retStatus = _statuses.retweeted_status;
    // 昵称Frame
    CGFloat retNameX = WRStatusCellMargin;
    CGFloat retNameY = WRStatusCellMargin;
    CGSize retNameSize = [_statuses.retweetName textSizeWithFontSize:WRNameFontSize contraintSize:WRNameConstraintSize];
    _retweetNameFrame = CGRectMake(retNameX, retNameY, retNameSize.width, retNameSize.height);
    // 正文Frame
    CGFloat retTextX = retNameX;
    CGFloat retTextY = CGRectGetMaxY(_retweetNameFrame) + WRStatusCellMargin;
    CGSize retTextSize = [retStatus.text textSizeWithFontSize:WRTextFontSize contraintSize:WRTextConstraintSize];
    _retweetTextFrame = CGRectMake(retTextX, retTextY, retTextSize.width, retTextSize.height);
    
    
    CGFloat retH = CGRectGetMaxY(_retweetTextFrame) + WRStatusCellMargin;
    // 配图
    if (retStatus.pic_urls) {
        
    }
    
    //转发微博的Frame
    CGFloat retX = 0;
    CGFloat retY = CGRectGetMaxY(_originalViewFrame);
    CGFloat retW = WRScreenW;
    
    _retweetViewFrame = CGRectMake(retX, retY, retW, retH);
    
}



@end
