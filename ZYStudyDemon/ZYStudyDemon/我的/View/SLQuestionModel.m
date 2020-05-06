//
//  SLQuestionModel.m
//  ZYStudyDemon
//
//  Created by yong on 2020/2/19.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import "SLQuestionModel.h"

@implementation SLQuestionModel


-(NSMutableArray *)selectAnswerArray
{
    if (!_selectAnswerArray) {
        _selectAnswerArray = @[].mutableCopy;
    }
    return _selectAnswerArray;
}
@end
