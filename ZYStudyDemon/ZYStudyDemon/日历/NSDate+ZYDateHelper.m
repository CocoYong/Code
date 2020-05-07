//
//  NSDate+ZYDateHelper.m
//  ZYStudyDemon
//
//  Created by yong on 2020/5/7.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import "NSDate+ZYDateHelper.h"

@implementation NSDate (ZYDateHelper)
-(NSInteger)getDaysWithMonth:(NSInteger)month andYear:(NSInteger)year
{
    NSCalendar *calender =[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [[NSDateComponents alloc]init];
    components.calendar = calender;
    components.month = month;
    components.year  = year;
    components.day = 1;
    return [self getDaysWithDate:components.date];
}
-(NSInteger)getDaysWithDate:(NSDate*)date
{
    NSCalendar *calender =[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSRange range = [calender rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}
-(NSInteger)getYearWith:(NSDate*)date
{
     NSCalendar *calender =[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear;
    NSDateComponents *components = [calender components:unitFlags fromDate:date];
    return components.year;
}
-(NSInteger)getMonthWith:(NSDate*)date
{
     NSCalendar *calender =[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear;
    NSDateComponents *components = [calender components:unitFlags fromDate:date];
    return components.month;
}
//-(NSDate*)chineseDateWithGregorianDate:(NSDate*)date
//{
//    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//    formatter.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
//
//}




@end
