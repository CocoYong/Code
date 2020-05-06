//
//  ZYTabBarLeftTransition.m
//  ZYStudyDemon
//
//  Created by yong on 2019/6/27.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import "ZYTabBarLeftTransition.h"

@implementation ZYTabBarLeftTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1.6f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromCtl = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toCtl = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView, *toView;
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromCtl.view;
        toView = toCtl.view;
    }

    CGRect screenBounds = [UIScreen mainScreen].bounds;
    toView.frame = CGRectMake(+screenBounds.size.width, 0, screenBounds.size.width, screenBounds.size.height);
    fromView.frame = screenBounds;
    [[transitionContext containerView] addSubview:toView];

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.frame = screenBounds;
        fromView.frame = CGRectMake(-screenBounds.size.width, 0, screenBounds.size.width, screenBounds.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
