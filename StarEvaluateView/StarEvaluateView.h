//
//  StarEvaluateView.h
//  TestWebView
//
//  Created by yong zhang on 2018/4/11.
//  Copyright © 2018年 yong zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

IB_DESIGNABLE
@interface StarEvaluateView : UIView

//星星尺寸大小
@property (assign, nonatomic) IBInspectable CGSize starSize;

//每个星星之间的间隔
@property (assign, nonatomic) IBInspectable CGFloat padding;


//未选中时候的颜色 默认为浅灰色= [UIColor colorWithRed: 0.932 green: 0.931 blue: 0.931 alpha: 1]
@property (strong, nonatomic) IBInspectable UIColor *normalColor;

//选中时候的颜色 默认为红色
@property (strong, nonatomic) IBInspectable UIColor *selectColor;

//starNum 默认为5个星星
@property (assign, nonatomic) IBInspectable NSInteger starNum;

//默认红星数
@property (assign, nonatomic) IBInspectable NSInteger defaultValue;

//starValue  - 用户点击星星后用来获得评价的星星数
@property (assign, nonatomic)  NSInteger starValue;

-(instancetype)initWithFrame:(CGRect)frame;

@end
