//
//  ZYTabBarLeftTransition.h
//  ZYStudyDemon
//
//  Created by yong on 2019/6/27.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ZYTabBarLeftTransition : NSObject<UIViewControllerAnimatedTransitioning>
@property (assign, nonatomic) NSInteger preIndex;
@property (assign, nonatomic) NSInteger selectedIndex;
@end

NS_ASSUME_NONNULL_END
