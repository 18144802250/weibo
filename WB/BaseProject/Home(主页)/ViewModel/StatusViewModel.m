//
//  StatusViewModel.m
//  我的微博
//
//  Created by apple-jd28 on 15/10/26.
//  Copyright © 2015年 apple-jd28. All rights reserved.
//

#import "StatusViewModel.h"
#import "WRStatusFrame.h"

@implementation StatusViewModel

- (NSInteger)rowNumber
{
    return self.dataArr.count;
}

- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

- (NSMutableArray *)frameArr {
    if(_frameArr == nil) {
        _frameArr = [[NSMutableArray alloc] init];
    }
    return _frameArr;
}

- (void)getDataWithCompletionHandle:(void(^)(NSError *error))complete
{
    [StatusNetManager getStatusWithStatusParamType:_type typeID:_idStr completeHandle:^(StatusModel *model, NSError *error) {
        
        if ([_idStr isEqualToString:[self.dataArr.firstObject idstr]]) {
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, model.statuses.count)];
            _count = model.statuses.count;
            [self.dataArr insertObjects:model.statuses atIndexes:indexSet];
        } else {
            [self.dataArr addObjectsFromArray:model.statuses];
        }
       
        for (StatusStatusesModel *statuses in self.dataArr) {
            WRStatusFrame *statusframe = [WRStatusFrame new];
            statusframe.statuses = statuses;
            [self.frameArr addObject:statusframe];
        }
        
        complete(error);
    }];
}

- (void)getNewWithCompleteHandle:(void (^)(NSError *))complete
{
    _type = StatusParamTypeNew;
    if (self.dataArr.count) {
        _idStr = [self.dataArr[0] idstr];
    }
    
    [self getDataWithCompletionHandle:complete];
}

-(void)getMoreWithCompleteHandle:(void (^)(NSError *))complete
{
    _type = StatusParamTypeMore;
    if (self.dataArr.count) {
        long long maxId = [[[self.dataArr lastObject] idstr] longLongValue] - 1;
        _idStr = [NSString stringWithFormat:@"%lld",maxId];
    }

    
    [self getDataWithCompletionHandle:complete];
}
@end
