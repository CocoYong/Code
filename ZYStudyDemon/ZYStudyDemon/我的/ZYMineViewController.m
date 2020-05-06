//
//  ZYMineViewController.m
//  ZYStudyDemon
//
//  Created by yong on 2020/2/18.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import "ZYMineViewController.h"
#import "SLFourStepsView.h"
#import "SLQquestionManagerView.h"
#import "SLQuestionModel.h"
#import "SLQuestionView.h"
#import "ZYTestViewController.h"


@interface ZYMineViewController ()
@property (strong, nonatomic)  SLQquestionManagerView *questionManagerView;
@end

@implementation ZYMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZYTestViewController  *textViewController = [[ZYTestViewController alloc]init];
    [self.navigationController pushViewController:textViewController animated:YES];
    
    
    
    
    SLQuestionModel *model = [[SLQuestionModel alloc]init];
    model.questionType = @"多选";
    model.questionTitle = @"1.重疾险怎样才能提前给付呢？怎样才能提前给付呢？怎样才能提前给付呢？（多选）";
    model.answerArray = @[@"A.提前给付重大疾病险一般设有一个等待期。假设等待期为90天，那么投保",@"B. 提前给付重大疾病险一般设有一个等待期。",@"C. 提前给付重大疾病险一般设有一个等待期。等待期是多长时间呢？需要做什么准备工作呢？是否可以退保呢？",@"D. 提前给付重大疾病险一般设有一个等待期。需要在等待期内填写相关文件等等"];

    _questionManagerView = [SLQquestionManagerView createViewWithFrame:CGRectZero Model:model];
    [self.view addSubview:_questionManagerView];
    _questionManagerView.backgroundColor = [UIColor redColor];
    
    [_questionManagerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.right.mas_equalTo(0);
    }];
  

}
- (IBAction)lastQuestion:(id)sender {
    
    [self.questionManagerView lastQuestion];
}

- (IBAction)nextQuestion:(id)sender {
    SLQuestionModel *model = [[SLQuestionModel alloc]init];
    model.questionType = @"简答";
    model.questionTitle = @"1.重疾险怎样才能提前给付呢？怎样才能提前给付呢？怎样才能提前给付呢？（单选）";
    model.answerArray = @[@"A.提前给付重大疾病险一般设有一个等待期。假设等待期为90天，那么投保",@"B. 提前给付重大疾病险一般设有一个等待期。",@"C. 提前给付重大疾病险一般设有一个等待期。等待期是多长时间呢？需要做什么准备工作呢？是否可以退保呢？",@"D. 提前给付重大疾病险一般设有一个等待期。需要在等待期内填写相关文件等等"];
    [self.questionManagerView nextQuestionWithModel:model];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
