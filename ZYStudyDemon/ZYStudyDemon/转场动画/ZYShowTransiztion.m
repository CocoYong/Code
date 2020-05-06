//
//  ZYModelTransiztion.m
//  ZYStudyDemon
//
//  Created by yong on 2019/6/14.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import "ZYShowTransiztion.h"

@interface ZYShowTransiztion ()

@end
@implementation ZYShowTransiztion
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
//    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

//    CGRect fromRect = [transitionContext initialFrameForViewController:fromVC];

    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finalFrame, screenBounds.size.width, screenBounds.size.width);

    UIView *container = [transitionContext containerView];
    [container addSubview:toVC.view];

    NSTimeInterval seconds = [self transitionDuration:transitionContext];

    [UIView animateWithDuration:seconds animations:^{
        toVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
