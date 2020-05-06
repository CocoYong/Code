//
//  ZYModelTransitionController.m
//  ZYStudyDemon
//
//  Created by yong on 2019/6/18.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import "ZYModelTransitionController.h"
#import "ZYTestModel.h"
#import "UIButton+WebCache.h"

@interface ZYModelTransitionController ()

@end

@implementation ZYModelTransitionController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];

    UIButton *dismissButt = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect tempRect = dismissButt.frame;
    tempRect.size =  CGSizeMake(300, 300);
    dismissButt.frame = tempRect;
    dismissButt.center = self.view.center;

    dismissButt.backgroundColor = [UIColor yellowColor];
    [dismissButt addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:dismissButt];
    
    [dismissButt sd_setImageWithURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3444372765,1447583286&fm=11&gp=0.jpg"] forState:UIControlStateNormal completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
    
}

- (void)dismissSelf
{
    ZYTestModel *testModel = [ZYTestModel new];
    [testModel food];
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
