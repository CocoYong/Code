//
//  FaceViewController.m
//  ZYStudyDemon
//
//  Created by yong zhang on 2018/6/28.
//  Copyright © 2018年 yong zhang. All rights reserved.
//

//面容识别，指纹识别认证
//NSFaceIDUsageDescription  在info.plist 中添加此项

#import "ZYFaceViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ZYFaceViewController ()

@end

@implementation ZYFaceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"请输入用户ID";

    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myLocalizedReasonString
                            reply:^(BOOL success, NSError *error) {
            if (success) {
                // User authenticated successfully, take appropriate action
            } else {
                NSLog(@"失败了😁");
                // User did not authenticate successfully, look at error and take appropriate action
            }
        }];
    } else {
        // Could not evaluate policy; look at authError and present an appropriate message to user
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
