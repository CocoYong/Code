//
//  ZYTestViewController.m
//  ZYStudyDemon
//
//  Created by yong on 2019/2/13.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import "ZYTestViewController.h"

@interface ZYTestViewController ()

@property (strong, nonatomic) IBOutlet UIView *testView;

@property (weak, nonatomic) IBOutlet UIView *viewOne;
@property (strong, nonatomic) IBOutlet UIView *testViewTwo;

@end

@implementation ZYTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.testViewTwo.frame = CGRectMake(100, 300, 200, 200);
    [[UIApplication sharedApplication].keyWindow addSubview:self.testViewTwo];
    
    
    
    self.testView.frame =[UIScreen mainScreen].bounds;
    [self.navigationController.view addSubview:self.testView];
    
    
    
    
  
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
