//
//  CircleView.m
//  阳光·车生活
//
//  Created by 祥云创想 on 17/2/7.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "CircleView.h"

@interface CircleView ()
@property (nonatomic, strong) CABasicAnimation *animation;
@end

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height)
                                               radius:self.frame.size.width/2
                                           startAngle:M_PI
                                             endAngle:0
                                            clockwise:YES];
        
        _bgLayer = [CAShapeLayer layer];
        _bgLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        _bgLayer.fillColor = [UIColor clearColor].CGColor;
        _bgLayer.lineWidth = 6.f;
        _bgLayer.strokeColor = [UIColor redColor].CGColor;//[UIColor whiteColor].CGColor;
//        _bgLayer.strokeStart = 0.5f;
//        _bgLayer.strokeEnd = 1.f;
        _bgLayer.path = _path.CGPath;
        
        [self.layer addSublayer:_bgLayer];
        
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.lineWidth = 6.f;
//        _shapeLayer.lineCap = kCALineCapRound;
        _shapeLayer.strokeColor = [UIColor redColor].CGColor;
//        _shapeLayer.strokeStart = 0.5f;
//        _shapeLayer.strokeEnd = 0.5f;
        
        
        _shapeLayer.path = _path.CGPath;
        [self.layer addSublayer:_shapeLayer];
        
    }
    return self;
}
-(void)setValue:(CGFloat)value{
    _value = value;


//
    [CATransaction begin];
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"strokEnd"];
    animation.duration = 0.25;
    
    _shapeLayer.autoreverses = NO;
    animation.fromValue = @(0.0);
    animation.toValue = @(0.8);
    _shapeLayer.strokeEnd = value;
    [_shapeLayer addAnimation:animation forKey:@"animateStrokeEnd"];
    [CATransaction commit];
}

-(void)setLineColr:(UIColor *)lineColr{
    _lineColr = lineColr;
    _shapeLayer.strokeColor = lineColr.CGColor;
}
-(void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    _shapeLayer.lineWidth = lineWidth;
    _bgLayer.lineWidth = lineWidth;
}
@end
