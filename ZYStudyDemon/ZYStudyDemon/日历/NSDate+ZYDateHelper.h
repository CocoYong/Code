//
//  NSDate+ZYDateHelper.h
//  ZYStudyDemon
//
//  Created by yong on 2020/5/7.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (ZYDateHelper)

/// 获取每月天数
/// @param month 月份
/// @param year 年
-(NSInteger)getDaysWithMonth:(NSInteger)month andYear:(NSInteger)year;

//获取date所在月份的天数
-(NSInteger)getDaysWithDate:(NSDate*)date;

-(NSInteger)getMonthWith:(NSDate*)date;

-(NSInteger)getYearWith:(NSDate*)date;



@end
NS_ASSUME_NONNULL_END
