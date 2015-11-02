//
//  StatusModel.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/24.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "BaseModel.h"

@class StatusUserModel;

@interface StatusModel : BaseModel


@property (nonatomic, assign) double totalNumber;

@property (nonatomic, strong) NSArray *statuses;



@end


@class StatusUserModel;

@interface StatusStatusesModel : BaseModel
/**
 *  转发微博
 */
@property (nonatomic, strong) StatusStatusesModel *retweeted_status;
/**
 *  转发微博昵称
 */
@property (nonatomic, copy) NSString *retweetName;
/**
 *  用户
 */
@property (nonatomic, strong) StatusUserModel *user;
/**
 *  微博创建时间
 */
@property (nonatomic, copy) NSString *created_at;
/**
 *  字符串型的微博ID
 */
@property (nonatomic, copy) NSString *idstr;
/**
 *  微博信息内容
 */
@property (nonatomic, copy) NSString *text;
/**
 *  微博来源
 */
@property (nonatomic, copy) NSString *source;
/**
 *  转发数
 */
@property (nonatomic, assign) int reposts_count;
/**
 *  评论数
 */
@property (nonatomic, assign) int comments_count;
/**
 *  表态数(赞)
 */
@property (nonatomic, assign) int attitudes_count;
/**
 *  配图数组(CZPhoto)
 */
@property (nonatomic, strong) NSArray *pic_urls;

@end



@interface StatusUserModel : NSObject

/**
 *  微博昵称
 */
@property (nonatomic, copy) NSString *name;

/**
 *  微博头像
 */
@property (nonatomic, strong) NSURL *profile_image_url;

/** 会员类型 > 2代表是会员 */
@property (nonatomic, assign) int mbtype;
/** 会员等级 */
@property (nonatomic, assign) int mbrank;


@property (nonatomic, assign,getter=isVip) BOOL vip;

@end

@interface StatusPicUrlsModel : BaseModel

@property (nonatomic, strong) NSString *thumbnailPic;

@end
