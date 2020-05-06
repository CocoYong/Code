//
//  SLQuestionView.m
//  ZYStudyDemon
//
//  Created by yong on 2020/2/19.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import "SLQuestionView.h"
#import "ZYQuestionViewCell.h"

@interface SLQuestionView ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UILabel *questionTitleLabel;
@property (strong, nonatomic) UITextView *jianDaAnswerView;
@property (strong, nonatomic) SLQuestionModel *questionModel;

@end

@implementation SLQuestionView

- (instancetype)initWithFrame:(CGRect)frame andQuestionModel:(SLQuestionModel *)questionModel
{
    if (self = [super initWithFrame:frame]) {
        self.questionModel = questionModel;
        _questionTitleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _questionTitleLabel.font = [UIFont systemFontOfSize:15];
        _questionTitleLabel.textColor = UIColorFromHex(0x333333);
        _questionTitleLabel.text = questionModel.questionTitle;
        _questionTitleLabel.numberOfLines = 0;
        [self addSubview:_questionTitleLabel];

        [self.tableView registerClass:[ZYQuestionViewCell class] forCellReuseIdentifier:@"ZYQuestionViewCell"];
        //创建问题答案视图
        [self initAnswerViewWithType:questionModel.questionType];
        
    }
    return self;
}

- (void)updateConstraints
{
    [super updateConstraints];
    
    if ([self.questionModel.questionType isEqualToString:@"简答"]) {
        [_questionTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
        }];
        [_jianDaAnswerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_questionTitleLabel.mas_bottom).offset(20);
            make.left.right.mas_equalTo(self);
            make.height.mas_equalTo(180);
        }];
    } else {
        [_questionTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
        }];
        [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_questionTitleLabel.mas_bottom).offset(22.5);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_greaterThanOrEqualTo(self.tableView.contentSize.height);//数据未加载完 加载的是cell的默认高度和也就是44*cell数量
            make.bottom.mas_equalTo(0);
        }];
    }
}

- (void)initAnswerViewWithType:(NSString *)questionType
{
    if ([questionType isEqualToString:@"简答"]) {
        _jianDaAnswerView = [[UITextView alloc] init];
//        _jianDaAnswerView.hidenTitleLabel=YES;
//        _jianDaAnswerView.backgroundColor = UIColor.backgroundColorF5F5F5;
        _jianDaAnswerView.layer.cornerRadius = 5.0f;
        _jianDaAnswerView.layer.borderWidth = 1.0f;
//        _jianDaAnswerView.layer.borderColor = [UIColor cDDDDDD].CGColor;
        [self addSubview:_jianDaAnswerView];
    } else {
        [self addSubview:self.tableView];
    }
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.estimatedRowHeight = 80;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

#pragma mark - ---------->>>>>>>>>>tableViewDataSource<<<<<<<<<<----------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.questionModel.questionType isEqualToString:@"多选"]) {
        if ([self.questionModel.selectAnswerArray containsObject:self.questionModel.answerArray[indexPath.row]]) {
            [self.questionModel.selectAnswerArray removeObject:self.questionModel.answerArray[indexPath.row]];
        } else {
            [self.questionModel.selectAnswerArray addObject:self.questionModel.answerArray[indexPath.row]];
        }
    } else {
        [self.questionModel.selectAnswerArray removeAllObjects];
        [self.questionModel.selectAnswerArray addObject:self.questionModel.answerArray[indexPath.row]];
    }
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.questionModel.answerArray.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGRect textRect = [self.questionModel.answerArray[indexPath.row] boundingRectWithSize:CGSizeMake(UIScreenWidth - 87, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
//    return textRect.size.height + 24;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYQuestionViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYQuestionViewCell" forIndexPath:indexPath];
    NSString *answerOne = [self.questionModel.answerArray objectAtIndex:indexPath.row];
    cell.answerLabel.text = answerOne;
    if ([self.questionModel.selectAnswerArray containsObject:cell.answerLabel.text]) {
        cell.stateView.image = [UIImage imageNamed:@"完成"];
    } else {
        cell.stateView.image = [UIImage imageNamed:@""];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_greaterThanOrEqualTo(self.tableView.contentSize.height); //cell加载完成后更新tableview高度约束
    }];
}

@end
