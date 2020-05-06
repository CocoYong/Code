//
//  ZYTestViewController.m
//  ZYStudyDemon
//
//  Created by yong on 2020/4/14.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import "ZYTestViewController.h"
#import "ZYCalenderView.h"
@interface ZYTestViewController ()

@end

@implementation ZYTestViewController
-(instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder]) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    ZYCalenderView *view = [[ZYCalenderView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.width)];
    [self.view addSubview:view];
    
    // Do any additional setup after loading the view from its nib.
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
