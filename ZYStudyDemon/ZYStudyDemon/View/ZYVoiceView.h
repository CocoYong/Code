//
//  ZYVoiceView.h
//  ZYStudyDemon
//
//  Created by yong on 2019/6/6.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYVoiceView : UIView


@property (assign, nonatomic)  CGFloat stepLength;


@property (assign, nonatomic)  CGFloat maxHeight;



@property (strong, nonatomic)  UIColor *lineColor;


@property (strong, nonatomic)   UIColor*bgColor;

-(instancetype)initWithFrame:(CGRect)frame
               andStepLength:(CGFloat)stepLength
                andMaxHeight:(CGFloat)maxHeight
                andLineColor:(UIColor*)lineColor
                  andBgColor:(UIColor*)bgColor;

@end

NS_ASSUME_NONNULL_END
