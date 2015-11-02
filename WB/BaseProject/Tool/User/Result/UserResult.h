//
//  UserResult.h
//  我的微博
//
//  Created by apple-jd28 on 15/10/27.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//


@interface UserResult : NSObject

/**
 *  新微博未读数
 */
@property (nonatomic, assign) int status;
/**
 *  新粉丝数
 */
@property (nonatomic, assign) int follower;
/**
 *  新评论数
 */
@property (nonatomic, assign) int cmt;
/**
 *  新私信数
 */
@property (nonatomic, assign) int dm;
/**
 *  新提及我的微博数
 */
@property (nonatomic, assign) int mention_status;
/**
 *  新提及我的评论数
 */
@property (nonatomic, assign) int mention_cmt;

- (int)messageCount;

- (int)totalCount;

@end
