//
//  ZYJingCaiViewController.m
//  ZYStudyDemon
//
//  Created by yong on 2020/2/18.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import "ZYJingCaiViewController.h"

@interface ZYJingCaiViewController ()

@end

@implementation ZYJingCaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSCalendar *calender = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    NSLog(@"range of day %@",NSStringFromRange([calender rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]]));
     NSLog(@"number of day %ld",[calender ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]]);
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
