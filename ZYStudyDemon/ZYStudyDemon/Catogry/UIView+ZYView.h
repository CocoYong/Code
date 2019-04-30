//
//  UIView+ZYView.h
//  ZYStudyDemon
//
//  Created by yong on 2019/2/13.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZYView)

/**
 带半透明背景的弹窗

 @param controller 弹窗的控制器
 */
- (void)popUpInController:(UIViewController *)controller;

/**
 view设置圆角边框颜色和宽度

 @param color 边框颜色
 @param width 边框宽度
 @param radius 圆角半径
 */
- (void)changeBorderColor:(UIColor *)color
              borderWidth:(CGFloat)width
             cornerRadius:(CGFloat)radius;

/**
 设置view的阴影(特别注意:调用本方法 如果view有子视图 view的layer的masksToBounds属性不能设置为YES)
 view必须有背景色(不能是clearColor 或者default),
 @param shadowColor 阴影颜色
 @param radius 阴影半径
 @param offset 阴影偏移
 @param opacity 阴影透明度
 */
- (void)addShadowWith:(UIColor *)shadowColor
         shadowRadius:(CGFloat)radius
         shadowOffset:(CGSize)offset
        shadowOpacity:(CGFloat)opacity;

@end
NS_ASSUME_NONNULL_END
