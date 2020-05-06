//
//  ZYTransitionController.m
//  ZYStudyDemon
//
//  Created by yong on 2019/6/14.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import "ZYTransitionController.h"
#import "ZYModelTransitionController.h"
#import "ZYShowTransiztion.h"
#import "ZYDismissTransition.h"

@interface ZYTransitionController ()<UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate>

@property (strong, nonatomic)  UITableView *tableView;

@property (strong, nonatomic)  NSArray *animationNameArray;

@property (strong, nonatomic)  ZYShowTransiztion *showTransition;

@property (strong, nonatomic)  ZYDismissTransition *dismissTransition;
@end

@implementation ZYTransitionController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"转场动画";

    self.animationNameArray = @[@"平移"];

    self.showTransition = [ZYShowTransiztion new];

    self.dismissTransition = [ZYDismissTransition new];

    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.rowHeight = 44;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

#pragma mark - ---------->>>>>>>>>>tableViewDataSource<<<<<<<<<<----------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYModelTransitionController *modelController = [ZYModelTransitionController new];
    modelController.transitioningDelegate = self;
    modelController.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:modelController animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.animationNameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ZYTransitionController";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.animationNameArray[indexPath.row];
    return cell;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.showTransition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissTransition;
}

@end
