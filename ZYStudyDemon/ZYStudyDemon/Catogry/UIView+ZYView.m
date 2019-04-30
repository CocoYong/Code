//
//  UIView+ZYView.m
//  ZYStudyDemon
//
//  Created by yong on 2019/2/13.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import "UIView+ZYView.h"

@implementation UIView (ZYView)
- (void)popUpInController:(UIViewController *)controller
{
    if (controller.navigationController) {
        [controller.navigationController.view addSubview:self];
    } else if (controller.tabBarController) {
        [controller.tabBarController.view addSubview:self];
    } else {
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
}

- (void)changeBorderColor:(UIColor *)color
              borderWidth:(CGFloat)width
             cornerRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

- (void)addShadowWith:(UIColor *)shadowColor
         shadowRadius:(CGFloat)radius
         shadowOffset:(CGSize)offset
        shadowOpacity:(CGFloat)opacity
{
    if (self.layer.masksToBounds == YES) {
        self.layer.masksToBounds = NO;
    }
    NSAssert(CGColorEqualToColor(self.backgroundColor.CGColor, [UIColor clearColor].CGColor), @"背景颜色不能为透明");
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowOffset = offset;
    self.layer.shadowColor = shadowColor.CGColor;
}

@end
