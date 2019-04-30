//
//  ZYActivity.m
//  ZYStudyDemon
//
//  Created by yong on 2018/7/2.
//  Copyright © 2018年 yong zhang. All rights reserved.
//

#import "ZYActivity.h"

@implementation ZYActivity
- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
}

- (nullable UIActivityType)activityType
{
    return UIActivityTypePostToFacebook;
}

- (nullable NSString *)activityTitle
{
    return @"哈哈哈哈哈 测试啦";
}

- (nullable UIImage *)activityImage
{
    return [UIImage imageNamed:@"head_bg"];
}

@end
