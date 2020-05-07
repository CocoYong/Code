//
//  ZYCollectionHeaderView.m
//  ZYStudyDemon
//
//  Created by yong on 2020/5/6.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import "ZYCollectionHeaderView.h"

@interface ZYCollectionHeaderView ()
@property (nonatomic,   strong)  NSDictionary *weekDic;
@end

@implementation ZYCollectionHeaderView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.weekDic = @{ @1: @"周日", @2: @"周一", @3: @"周二", @4: @"周三", @5: @"周四", @6: @"周五", @7: @"周六" };
    for (NSNumber *num in self.weekDic.allKeys) {
        [(UILabel *)[self viewWithTag:num.integerValue] setText:self.weekDic[num]];
    }
}



- (void)setFirstWeekDay:(NSInteger)firstWeekDay
{
    _firstWeekDay = firstWeekDay;
}

@end
