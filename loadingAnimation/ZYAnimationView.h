//
//  ZYAnimationView.h
//  OnlineTutoring
//
//  Created by yong zhang on 2018/6/2.
//  Copyright © 2018年 yong zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYAnimationView : UIView

@property (strong, nonatomic)  CABasicAnimation *pathAnima;
@property (strong, nonatomic)  CALayer *bgLayer;

-(void)startAnimation;
-(void)stopAnimation;
@end
