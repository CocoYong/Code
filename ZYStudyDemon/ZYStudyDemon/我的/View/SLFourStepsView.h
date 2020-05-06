//
//  SLFourStepsView.h
//  SnowLeopard
//
//  Created by yong on 2020/2/18.
//  Copyright © 2020 Anbang Insurance Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLCombineView.h"
NS_ASSUME_NONNULL_BEGIN

@interface SLFourStepsView : UIView


@property (strong, nonatomic)  UIImage *normalImage;
@property (strong, nonatomic)  UIImage *willSelectImage;
@property (strong, nonatomic)  UIImage *selectImage;

@property (strong, nonatomic)  UIColor *lineColor;

@property (strong, nonatomic)  UIColor *wordsNormalColor;
@property (strong, nonatomic)  UIColor *wordsSelectColor;

@property (assign, nonatomic)  MASAxisType axisType;

@property (assign, nonatomic)  NSInteger startIndex;

- (instancetype)initWithFrame:(CGRect)frame andTotalStepsWordsArray:(NSArray *)stepsWords;
@end

NS_ASSUME_NONNULL_END
