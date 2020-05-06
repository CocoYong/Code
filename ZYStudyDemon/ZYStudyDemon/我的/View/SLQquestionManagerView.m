//
//  SLQquestionView.m
//  ZYStudyDemon
//
//  Created by yong on 2020/2/19.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import "SLQquestionManagerView.h"
#import "SLQuestionView.h"
@interface SLQquestionManagerView ()
@property (strong, nonatomic)  NSMutableArray <SLQuestionModel *> *questionArray;

@end
@implementation SLQquestionManagerView
+ (instancetype)createViewWithFrame:(CGRect)frame Model:(SLQuestionModel *)questionModel
{
    SLQquestionManagerView *questionView = [[SLQquestionManagerView alloc]initWithFrame:frame];
    questionView.questionArray = @[].mutableCopy;
    [questionView.questionArray addObject:questionModel];
    [questionView createSubViewWithModel:questionModel];
    return questionView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)createSubViewWithModel:(SLQuestionModel *)model
{
    SLQuestionView *questionView = [[SLQuestionView alloc]initWithFrame:CGRectZero andQuestionModel:model];
    [self addSubview:questionView];
    questionView.backgroundColor = [UIColor greenColor];
    [questionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(45);
        make.left.right.bottom.mas_equalTo(0);
    }];
}

- (void)nextQuestionWithModel:(SLQuestionModel *)model
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    SLQuestionView *questionView = [[SLQuestionView alloc]initWithFrame:CGRectZero andQuestionModel:model];
    [self addSubview:questionView];
    questionView.backgroundColor = [UIColor greenColor];
    [self.questionArray addObject:model];
    [questionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(45);
        make.left.right.bottom.mas_equalTo(0);
    }];
}

- (void)lastQuestion
{
    [self.questionArray removeLastObject];
    if (self.questionArray.count > 0) { //第一题的时候需要判断下
        SLQuestionView *questionView = [[SLQuestionView alloc]initWithFrame:CGRectZero andQuestionModel:self.questionArray.lastObject];
        [self addSubview:questionView];
        questionView.backgroundColor = [UIColor greenColor];
        [questionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(45);
            make.left.right.bottom.mas_equalTo(0);
        }];
//        [self mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(CGRectGetMaxY(questionView.frame));
//        }];
    }
}

@end
