//
//  ZYDismissTransition.m
//  ZYStudyDemon
//
//  Created by yong on 2019/6/27.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import "ZYDismissTransition.h"

@interface ZYDismissTransition ()

@end
@implementation ZYDismissTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    CGRect fromRect = [transitionContext initialFrameForViewController:fromVC];

    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(fromRect, -screenBounds.size.width, -screenBounds.size.height);

    UIView *container = [transitionContext containerView];
    [container addSubview:toVC.view];
    [container sendSubviewToBack:fromVC.view];

    NSTimeInterval seconds = [self transitionDuration:transitionContext];

    [UIView animateWithDuration:seconds animations:^{
        toVC.view.frame = finalFrame;
        fromVC.view.frame = CGRectOffset(fromRect, screenBounds.size.width, screenBounds.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
