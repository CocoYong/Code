//
//  CircleView.h
//  阳光·车生活
//
//  Created by 祥云创想 on 17/2/7.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView
@property(strong,nonatomic)UIBezierPath *path;
@property(strong,nonatomic)CAShapeLayer *shapeLayer;
@property(strong,nonatomic)CAShapeLayer *bgLayer;
@property(assign,nonatomic)CGFloat value;
@property(strong,nonatomic)UIColor *lineColr;
@property(assign,nonatomic)CGFloat lineWidth;
@end
