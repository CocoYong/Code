//
//  BaseViewController.m
//  ZYStudyDemon
//
//  Created by yong on 2018/12/28.
//  Copyright © 2018 yong zhang. All rights reserved.
//

#import "ZYBaseViewController.h"
#import "ZYPushTransition.h"
#import "ZYPopTransition.h"


@interface ZYBaseViewController ()<UINavigationControllerDelegate>
@property (strong, nonatomic)  UIPercentDrivenInteractiveTransition *percentTransition; //交互动画
@property (strong, nonatomic)  ZYPushTransition *pushTransition; //push动画
@property (strong, nonatomic)  ZYPopTransition *popTransition;//pop动画
@end

@implementation ZYBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.navigationController.delegate = self;
    
    self.pushTransition = [ZYPushTransition new];
    self.popTransition = [ZYPopTransition new];
    
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(popGestrue:)];
    [self.view addGestureRecognizer:gestureRecognizer];
}

-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    if ([animationController isKindOfClass:[ZYPopTransition class]]) {
        return self.percentTransition;
    }
    return nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    if (operation==UINavigationControllerOperationPush) {
        return self.pushTransition;
    }else if(operation ==UINavigationControllerOperationPop)
    {
        return self.popTransition;
    }else
    {
        return nil;
    }
}

-(void)popGestrue:(UIPanGestureRecognizer*)gestrueRecognizer
{
   CGFloat process =  [gestrueRecognizer translationInView:self.view].x/[UIScreen mainScreen].bounds.size.width;
    
    process = MIN(1.0, MAX(0.0, process));
    
    if (gestrueRecognizer.state == UIGestureRecognizerStateBegan) {
        self.percentTransition = [UIPercentDrivenInteractiveTransition new];
         [self.navigationController popViewControllerAnimated:YES];
    }else if (gestrueRecognizer.state == UIGestureRecognizerStateChanged)
    {
        [self.percentTransition updateInteractiveTransition:process];
    }else if (gestrueRecognizer.state == UIGestureRecognizerStateEnded||gestrueRecognizer.state == UIGestureRecognizerStateCancelled)
    {
        if (process>0.5) {
            [self.percentTransition finishInteractiveTransition];
        }else
        {
            [self.percentTransition cancelInteractiveTransition];
        }
        self.percentTransition = nil;
    }
}


@end
