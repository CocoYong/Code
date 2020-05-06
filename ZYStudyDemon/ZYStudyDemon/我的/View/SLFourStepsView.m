//
//  SLFourStepsView.m
//  SnowLeopard
//
//  Created by yong on 2020/2/18.
//  Copyright © 2020 Anbang Insurance Group. All rights reserved.
//

#import "SLFourStepsView.h"

@interface SLFourStepsView ()
@property (strong, nonatomic)  UIView *backLineView;
@property (strong, nonatomic)  NSArray *stepsWordsArray;
@property (strong, nonatomic)  NSMutableArray <UIImageView *> *imagesArray;
@property (strong, nonatomic)  NSMutableArray <UILabel *> *labelsArray;
@end

@implementation SLFourStepsView

- (instancetype)initWithFrame:(CGRect)frame andTotalStepsWordsArray:(NSArray *)stepsWords
{
    if (self = [super initWithFrame:frame]) {
        self.stepsWordsArray = stepsWords;

        [self initUI];
    }
    return self;
}

- (void)initUI
{
    self.backgroundColor = [UIColor whiteColor];
    _backLineView = [[UIView alloc]initWithFrame:CGRectZero];
    _backLineView.backgroundColor = UIColorFromHex(0xEEEEEE);
    [self addSubview:_backLineView];

    [_backLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(2);
        make.top.mas_equalTo(31.5);
        make.left.mas_equalTo(52.5);
        make.right.mas_equalTo(-52.5);
    }];
//    NSMutableArray *buttonsArray = @[].mutableCopy;
    _imagesArray = @[].mutableCopy;
    _labelsArray = @[].mutableCopy;

    for (int i = 0; i < self.stepsWordsArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
//        imageView.image = [UIImage imageNamed:@"GreyPoint"]; //RedPoint
        imageView.backgroundColor = UIColorFromHex(0xEEEEEE);
        
        [self addSubview:imageView];
        [_imagesArray addObject:imageView];

//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [self addSubview:button];
//        [buttonsArray addObject:button];

        UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
        label.text = self.stepsWordsArray[i];
        label.textColor = UIColorFromHex(0x333333); //FF4D46
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        [_labelsArray addObject:label];
    }

//    [buttonsArray mas_distributeViewsAlongAxis:(_axisType==MASAxisTypeHorizontal?:MASAxisTypeVertical) withFixedItemLength:75.5 leadSpacing:52.5 tailSpacing:52.5];
//    [buttonsArray mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(22.5);
//        make.bottom.offset(5);
//        make.
//    }];

    
    
    
    [_imagesArray mas_distributeViewsAlongAxis:(_axisType == MASAxisTypeVertical ? MASAxisTypeVertical : MASAxisTypeHorizontal) withFixedItemLength:20 leadSpacing:47 tailSpacing:47];
    [_imagesArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(22.5);
        make.height.mas_equalTo(20);
    }];
    [_labelsArray mas_distributeViewsAlongAxis:(_axisType == MASAxisTypeVertical ? MASAxisTypeVertical : MASAxisTypeHorizontal) withFixedItemLength:35 leadSpacing:40 tailSpacing:40];
    [_labelsArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(47.5);
        make.height.mas_equalTo(21);
        
        
    }];
}

- (void)setStartIndex:(NSInteger)startIndex
{
    _startIndex = startIndex;
    if (startIndex >= self.stepsWordsArray.count) {
        for (int i = 0; i < self.stepsWordsArray.count; i++) {
            self.imagesArray[i].image = [UIImage imageNamed:@"完成"];
            self.labelsArray[i].textColor = UIColorFromHex(0xFF4D46);
        }
    } else {
        for (int i = 0; i < startIndex; i++) {
            self.imagesArray[i].image = [UIImage imageNamed:@"完成"];
            self.labelsArray[i].textColor = UIColorFromHex(0xFF4D46);
        }
        self.imagesArray[startIndex].image = [UIImage imageNamed:@"RedPoint"];
        self.labelsArray[startIndex].textColor = UIColorFromHex(0xFF4D46);
    }
}

@end
