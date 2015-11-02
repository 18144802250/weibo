//
//  Constants.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define WRAccountFilePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"account.data"]
#define WRVensionKey @"Vension"
/**
 * 布局
 */
#define WRStatusCellMargin 10
#define WRTextFontSize 16
#define WRNameFontSize 13
#define WRTimeFontSize 12
#define WRTextConstraintSize CGSizeMake(WRScreenW - 2*WRStatusCellMargin, WRScreenH)
#define WRNameConstraintSize CGSizeMake(WRScreenW - 2*WRStatusCellMargin, 50)
#define WRTimeFont [UIFont systemFontOfSize:12]
#define WRScreenW [UIScreen mainScreen].bounds.size.width
#define WRScreenH [UIScreen mainScreen].bounds.size.height

#define WRUidKey @"uid"
#define WRAccessTokenKey @"token"
#define WRExpires_inKey @"exoires"
#define WRExpires_dateKey @"date"
#define WRNameKey @"name"
#define WRKeyWindow [UIApplication sharedApplication].keyWindow
//通过RGB设置颜色
#define kRGBColor(R,G,B)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

#define kWindowH   [UIScreen mainScreen].bounds.size.height //应用程序的屏幕高度
#define kWindowW    [UIScreen mainScreen].bounds.size.width  //应用程序的屏幕宽度

#define kAppDelegate ((AppDelegate*)([UIApplication sharedApplication].delegate))

#define kStoryboard(StoryboardName)     [UIStoryboard storyboardWithName:StoryboardName bundle:nil]

//通过Storyboard ID 在对应Storyboard中获取场景对象
#define kVCFromSb(VCID, SbName)     [[UIStoryboard storyboardWithName:SbName bundle:nil] instantiateViewControllerWithIdentifier:VCID]

//移除iOS7之后，cell默认左侧的分割线边距
#define kRemoveCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}\

//Docment文件夹目录
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

#endif /* Constants_h */
