//
//  ZYUpcaseNumPadView.h
//  sunt6
//
//  Created by yong on 2018/8/9.
//  Copyright © 2018年 MrZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtClickDelegate<NSObject>
-(void)alphaAndNumClicked:(NSString*)passString;

@end


@interface ZYUpcaseNumPadView : UIInputView
@property (assign, nonatomic)  id<ButtClickDelegate>delegate;
@end
