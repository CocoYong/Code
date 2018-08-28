//
//  ZYAnimationView.m
//  OnlineTutoring
//
//  Created by yong zhang on 2018/6/2.
//  Copyright © 2018年 yong zhang. All rights reserved.
//

#import "ZYAnimationView.h"

@implementation ZYAnimationView

-(void)awakeFromNib
{
	[super awakeFromNib];
	self.layer.cornerRadius = self.bounds.size.width/2;
	self.layer.shadowColor= [UtilitiesHelper colorWithHexString:@"#F2EAFF"].CGColor;
	self.layer.shadowOffset = CGSizeMake(-5, 5);
	self.layer.shadowOpacity = 1;
	self.layer.shadowRadius  = 5;
	
	
	_bgLayer= [CALayer layer];
	CAGradientLayer *leftGradientLayer = [CAGradientLayer layer];
	leftGradientLayer.frame = CGRectMake(0, 0, self.bounds.size.width/2, self.bounds.size.height);
	leftGradientLayer.colors = @[(id)[UtilitiesHelper colorWithHexString:@"#947bd3"].CGColor,(id)[UIColor purpleColor].CGColor];
	leftGradientLayer.startPoint= CGPointMake(0.5, 1);
	leftGradientLayer.endPoint = CGPointMake(0.5, 0);
	
	CAGradientLayer *rightGradientLayer = [CAGradientLayer layer];
	rightGradientLayer.frame = CGRectMake(self.bounds.size.width/2, 0, self.bounds.size.width/2, self.bounds.size.height);
	rightGradientLayer.colors = @[(id)[UIColor whiteColor].CGColor,(id)[UtilitiesHelper colorWithHexString:@"#947bd3"].CGColor];
	rightGradientLayer.startPoint= CGPointMake(0, 0);
	rightGradientLayer.endPoint = CGPointMake(0, 1);
	
	[_bgLayer addSublayer:leftGradientLayer];
	[_bgLayer addSublayer:rightGradientLayer];
	
	[self.layer addSublayer:_bgLayer];
	
	CAShapeLayer *maskLayer = [CAShapeLayer layer];
	maskLayer.strokeColor = [UIColor clearColor].CGColor;
	maskLayer.fillColor = [UIColor whiteColor].CGColor;
	maskLayer.opacity = 1;
	maskLayer.lineWidth = 2;
	UIBezierPath *maskLayerPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.bounds.size.width/2-1 startAngle:0 endAngle:M_PI*2 clockwise:1];
	maskLayer.path = maskLayerPath.CGPath;
	[_bgLayer setMask:maskLayer];
	
	
	UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(6, 6, self.bounds.size.width-12, self.bounds.size.height-12)];
	subView.layer.cornerRadius = subView.bounds.size.width/2;
	subView.backgroundColor = [UIColor whiteColor];
	[self addSubview:subView];
}
-(void)startAnimation
{
	CAShapeLayer *animatingLayer = [CAShapeLayer layer];
	animatingLayer.strokeColor = [UIColor whiteColor].CGColor;
	animatingLayer.fillColor = [UIColor clearColor].CGColor;
	animatingLayer.lineWidth = 12;
	UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.bounds.size.width/2-6 startAngle:-M_PI_2 endAngle:M_PI*3/2 clockwise:1];
	animatingLayer.path = bezierPath.CGPath;
	[_bgLayer addSublayer:animatingLayer];
	animatingLayer.strokeStart = 0;
	animatingLayer.strokeEnd = 1;
	
	
	_pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
	_pathAnima.duration = 1.5f;
	_pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	_pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
	_pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
	_pathAnima.fillMode = kCAFillModeForwards;
	_pathAnima.removedOnCompletion = NO;
	_pathAnima.repeatCount=MAXFLOAT;
	[animatingLayer addAnimation:_pathAnima forKey:@"strokeEndAnimation"];
}
-(void)stopAnimation
{
	[_bgLayer removeAllAnimations];
}

@end
