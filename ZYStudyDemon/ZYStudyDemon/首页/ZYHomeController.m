//
//  ZYTableController.m
//  ZYStudyDemon
//
//  Created by yong zhang on 2018/6/28.
//  Copyright © 2018年 yong zhang. All rights reserved.
//

#import "ZYHomeController.h"

@interface ZYHomeController ()<UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ZYHomeController
{
    NSArray *titleArray;
    NSArray *controllerNameArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    titleArray = @[
        @"webview",
        @"FaceID&keyChain",
        @"分享",
        @"黑魔法",
        @"转场动画"
    ];
    controllerNameArray = @[
        @"ZYWebViewController",
        @"ZYFaceViewController",
        @"ZYSystemShareController",
        @"ZYBlackMagicController",
        @"ZYTransitionController"
    ];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = 100;
    NSLog(@"titleArray.description===%@",titleArray.description);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"roottablecell" forIndexPath:indexPath];
    cell.textLabel.text = titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UIViewController *controller = [[NSClassFromString(controllerNameArray[indexPath.row]) alloc]init];
    
    //添加系统定义的push动画
    [self.navigationController.view.layer addAnimation:[self pushTransition] forKey:nil];
    
    //模态视图的时候用
//     [self.view.window.layer addAnimation:[self presentAnimation] forKey:nil];//添加Animation
    [self.navigationController pushViewController:controller animated:YES];
}



-(CATransition*)pushTransition
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.6;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    /*私有API
     cube                   立方体效果
     pageCurl               向上翻一页
     pageUnCurl             向下翻一页
     rippleEffect           水滴波动效果
     suckEffect             变成小布块飞走的感觉
     oglFlip                上下翻转
     cameraIrisHollowClose  相机镜头关闭效果
     cameraIrisHollowOpen   相机镜头打开效果
     */
    //共有api
    //kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromRight;
    return transition;
}




@end
