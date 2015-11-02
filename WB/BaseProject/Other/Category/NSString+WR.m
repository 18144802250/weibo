//
//  NSString+WR.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/30.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "NSString+WR.h"

@implementation NSString (WR)

- (CGSize)textSizeWithFontSize:(CGFloat)fontSize contraintSize:(CGSize)size
{
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:fontSize];
  
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}

@end
