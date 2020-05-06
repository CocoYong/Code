//
//  ZYMainTabBarController.m
//  ZYStudyDemon
//
//  Created by yong on 2019/6/27.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import "ZYMainTabBarController.h"
#import "ZYTabBarRightTransition.h"
#import "ZYTabBarLeftTransition.h"


@interface ZYMainTabBarController ()<UITabBarControllerDelegate>
@property (strong, nonatomic)  UIPercentDrivenInteractiveTransition *percentTransition;
@property (strong, nonatomic)  ZYTabBarRightTransition *rightTransition;
@property (strong, nonatomic)  ZYTabBarLeftTransition *leftTransition;
@property (strong, nonatomic)  UISwipeGestureRecognizer *gestureRecognizer;

@end

@implementation ZYMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    UISwipeGestureRecognizer *gestureRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipGestrue:)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
}
//- (nullable id <UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
//                               interactionControllerForAnimationController: (id <UIViewControllerAnimatedTransitioning>)animationController
//{
//    return self.percentTransition;
//}


- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
                     animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                                       toViewController:(UIViewController *)toVC
{
    if (self.gestureRecognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        return self.rightTransition;
    }else if (self.gestureRecognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        return self.leftTransition;
    }else
    {
        return nil;
    }

}

-(void)swipGestrue:(UISwipeGestureRecognizer*)gestrueRecognizer
{

//    CGFloat process =  [gestrueRecognizer translationInView:self.view].x/[UIScreen mainScreen].bounds.size.width;
//
//    process = MIN(1.0, MAX(0.0, process));
    
    if (gestrueRecognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        if (self.selectedIndex>0) {
            self.selectedIndex--;
        }if (self.selectedIndex<0) {
            self.selectedIndex = 3;
        }
    }if (gestrueRecognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        if (self.selectedIndex<3) {
            self.selectedIndex++;
        }if (self.selectedIndex>3) {
            self.selectedIndex = 0;
        }
    }
    
    
//    if (gestrueRecognizer.state == UIGestureRecognizerStateBegan) {
//        self.percentTransition = [UIPercentDrivenInteractiveTransition new];
//    }else if (gestrueRecognizer.state == UIGestureRecognizerStateChanged)
//    {
//        [self.percentTransition updateInteractiveTransition:process];
//    }else if (gestrueRecognizer.state == UIGestureRecognizerStateEnded||gestrueRecognizer.state == UIGestureRecognizerStateCancelled)
//    {
//        if (process>0.5) {
//            [self.percentTransition finishInteractiveTransition];
//        }else
//        {
//            [self.percentTransition cancelInteractiveTransition];
//        }
//        self.percentTransition = nil;
//    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
