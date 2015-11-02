//
//  StatusViewModel.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/26.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "StatusModel.h"
#import "StatusNetManager.h"
#import "WRStatusFrame.h"

@interface StatusViewModel : NSObject

@property (nonatomic, assign) NSInteger rowNumber;
//微博数据
@property (nonatomic, strong) NSMutableArray *dataArr;
//frame数据
@property (nonatomic, strong) NSMutableArray *frameArr;

@property (nonatomic, assign) StatusParamType type;
/**
 *  请求数据的ID
 */
@property (nonatomic, strong) NSString *idStr;
/**
 *  最新的消息数
 */
@property (nonatomic, assign) NSInteger count;
//- (NSURL*)imageWithRow:(NSInteger)index;
//- (NSString*)userWithRow:(NSInteger)index;
//- (NSString*)textWithRow:(NSInteger)index;
//- (NSString*)commentWithRow:(NSInteger)index;
//- (NSString*)idStrWithRow:(NSInteger)index;

//- (StatusUserModel*)userDataWithRow:(NSInteger)index;

- (void)getMoreWithCompleteHandle:(void(^)(NSError *error))complete;

- (void)getNewWithCompleteHandle:(void(^)(NSError *error))complete;

@end
