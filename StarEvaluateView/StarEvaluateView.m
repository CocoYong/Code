//
//  StarEvaluateView.m
//  TestWebView
//
//  Created by yong zhang on 2018/4/11.
//  Copyright © 2018年 yong zhang. All rights reserved.
//

#import "StarEvaluateView.h"


@interface StarEvaluateView()
@property (strong, nonatomic)  UIBezierPath *starBezierPath;

@end
@implementation StarEvaluateView


-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
     
        [self propertiesInit];
        //创建starBgView
        [self createStarBgViewWithStarNum:self.starNum];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self propertiesInit];
        //创建starBgView
        [self createStarBgViewWithStarNum:self.starNum];
    
    }
    return self;
}
-(void)propertiesInit
{
    self.padding = 10;
    self.normalColor =[UIColor colorWithRed: 0.932 green: 0.931 blue: 0.931 alpha: 1];
    self.selectColor = [UIColor redColor];
    self.starNum = 5;
    self.defaultValue = 1;
    
}

-(void)createStarBgViewWithStarNum:(NSInteger)starNum
{
    for (int i=0; i<starNum; i++) {
        UIView *starBgView = [[UIView alloc]initWithFrame:CGRectMake(i*(self.padding+self.starSize.width),(self.bounds.size.height-self.starSize.width)/2, self.starSize.width, self.starSize.width)];
        starBgView.tag = (i+1)*111;
        CAShapeLayer *shapLayer = [CAShapeLayer layer];
        shapLayer.frame =CGRectMake(0, 0, self.starSize.width, self.starSize.width);
        [shapLayer setFillColor:self.normalColor.CGColor];
        [shapLayer setStrokeColor:[UIColor clearColor].CGColor];
        UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:self.starBezierPath.CGPath];
        [path applyTransform:CGAffineTransformMakeScale(self.starSize.width/path.bounds.size.width, self.starSize.width/path.bounds.size.height)];
        shapLayer.path = path.CGPath;
        [starBgView.layer addSublayer:shapLayer];
        [self addSubview:starBgView];
    }
}
-(void)updateStarViewShowingState
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self createStarBgViewWithStarNum:self.starNum];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view.tag == 0) {     //如果没点到星星上就直接返回不用管了
        return;
    }
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self createStarBgViewWithStarNum:self.starNum];
    
    NSInteger viewTag = touch.view.tag/111-1;
    for (int i=0; i<=viewTag; i++) {
        UIView *starBgView = [self viewWithTag:(i+1)*111];
        for (CALayer *layer in starBgView.layer.sublayers) {
            if ([layer isKindOfClass:[CAShapeLayer class]]) {
                CAShapeLayer *tempLayer = (CAShapeLayer*)layer;
                tempLayer.fillColor =self.selectColor.CGColor;
            }
        }
    }
    //设置红星的值
    self.starValue = viewTag+1;
    NSLog(@"value====%ld",viewTag+1);
}

#pragma mark - ---------->>>>>>>>>>懒加载<<<<<<<<<<----------
-(UIBezierPath*)starBezierPath
{
    UIBezierPath* starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint: CGPointMake(25, 0)];
    [starPath addLineToPoint: CGPointMake(33.82, 12.86)];
    [starPath addLineToPoint: CGPointMake(48.78, 17.27)];
    [starPath addLineToPoint: CGPointMake(39.27, 29.64)];
    [starPath addLineToPoint: CGPointMake(39.69, 45.23)];
    [starPath addLineToPoint: CGPointMake(25, 40)];
    [starPath addLineToPoint: CGPointMake(10.31, 45.23)];
    [starPath addLineToPoint: CGPointMake(10.73, 29.64)];
    [starPath addLineToPoint: CGPointMake(1.22, 17.27)];
    [starPath addLineToPoint: CGPointMake(16.18, 12.86)];
    [starPath closePath];
    return starPath;
}
-(NSInteger)starNum
{
    return _starNum == 0 ? 5:_starNum;
}
-(CGSize)starSize
{
    return CGSizeMake(22, 22);
}
-(void)setNormalColor:(UIColor *)normalColor
{
    if (_normalColor ==normalColor) {
        return;
    }
    _normalColor = normalColor;
    [self updateStarViewShowingState];
}
-(void)setSelectColor:(UIColor *)selectColor
{
    if (_selectColor == selectColor) {
        return;
    }
    _selectColor = selectColor;
     [self updateStarViewShowingState];
}
-(void)setDefaultValue:(NSInteger)defaultValue
{
    if (_defaultValue == defaultValue) {
        return;
    }
    _defaultValue = defaultValue;
    [self updateStarViewShowingState];
    for (int i=0; i<defaultValue; i++) {
        UIView *starBgView = [self viewWithTag:(i+1)*111];
        for (CALayer *layer in starBgView.layer.sublayers) {
            if ([layer isKindOfClass:[CAShapeLayer class]]) {
                CAShapeLayer *tempLayer = (CAShapeLayer*)layer;
                tempLayer.fillColor =self.selectColor.CGColor;
            }
        }
    }
    //设置红星的值
    self.starValue = defaultValue;
}
-(void)setPadding:(CGFloat)padding
{
    _padding = padding;
    [self updateStarViewShowingState];
}
@end
