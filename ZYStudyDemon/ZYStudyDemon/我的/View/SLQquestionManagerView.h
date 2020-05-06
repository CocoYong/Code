//
//  SLQquestionView.h
//  ZYStudyDemon
//
//  Created by yong on 2020/2/19.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLQuestionModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface SLQquestionManagerView : UIView
+(instancetype)createViewWithFrame:(CGRect)frame Model:(SLQuestionModel*)questionModel;
-(void)nextQuestionWithModel:(SLQuestionModel*)model;
-(void)lastQuestion;
@end

NS_ASSUME_NONNULL_END
