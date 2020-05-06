//
//  ZYVoiceView.m
//  ZYStudyDemon
//
//  Created by yong on 2019/6/6.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import "ZYVoiceView.h"

@implementation ZYVoiceView

-(instancetype)initWithFrame:(CGRect)frame
               andStepLength:(CGFloat)stepLength
                andMaxHeight:(CGFloat)maxHeight
                andLineColor:(UIColor*)lineColor
                  andBgColor:(UIColor*)bgColor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.stepLength = stepLength;
        self.maxHeight = maxHeight;
        self.lineColor = lineColor;
        self.bgColor = bgColor;
        
        
    }
    return self;
}

@end
