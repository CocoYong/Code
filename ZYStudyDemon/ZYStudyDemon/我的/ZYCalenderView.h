//
//  ZYCalenderView.h
//  ZYStudyDemon
//
//  Created by yong on 2020/5/6.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYCalenderView : UIView
@property (nonatomic,  assign)  UICollectionViewScrollDirection scrollDirection;
-(instancetype)initWithFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
