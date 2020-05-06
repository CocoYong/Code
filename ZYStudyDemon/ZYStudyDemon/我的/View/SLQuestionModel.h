//
//  SLQuestionModel.h
//  ZYStudyDemon
//
//  Created by yong on 2020/2/19.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLQuestionModel : NSObject
@property (copy,   nonatomic)  NSString *questionType; //判断、单选、多选、简答
@property (copy,   nonatomic)  NSString *questionTitle;
@property (strong, nonatomic)  NSArray <NSString*>*answerArray; //单选或多选
@property (strong, nonatomic)  NSMutableArray *selectAnswerArray; //选择的答案
@end
NS_ASSUME_NONNULL_END
