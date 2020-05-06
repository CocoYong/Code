//
//  ZYQuestionViewCell.m
//  ZYStudyDemon
//
//  Created by yong on 2020/2/19.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import "ZYQuestionViewCell.h"

@implementation ZYQuestionViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.stateView];
        [self.contentView addSubview:self.answerLabel];
        
        [self.stateView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(12);
            make.left.mas_equalTo(28);
            make.size.mas_equalTo(CGSizeMake(22, 22));
        }];
        
        [self.answerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.mas_equalTo(12);
            make.left.mas_equalTo(self.stateView.mas_right).offset(11);
            make.right.mas_equalTo(-28);
            make.bottom.mas_equalTo(-12);
        }];
    }
    return self;
}
-(UILabel *)answerLabel
{
    if (!_answerLabel) {
        _answerLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _answerLabel.textColor = UIColorFromHex(0x999999);
        _answerLabel.font = [UIFont systemFontOfSize:15];
        _answerLabel.numberOfLines = 0;
    }
    return _answerLabel;
}
-(UIImageView *)stateView
{
    if (!_stateView) {
        _stateView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _stateView.layer.borderWidth = 1;
        _stateView.layer.cornerRadius = 11;
        _stateView.layer.borderColor = UIColorFromHex(0xC9C9C9).CGColor;
    }
    return _stateView;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
