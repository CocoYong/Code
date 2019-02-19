//
//  ZYTableController.m
//  ZYStudyDemon
//
//  Created by yong zhang on 2018/6/28.
//  Copyright © 2018年 yong zhang. All rights reserved.
//

#import "ZYTableController.h"

@interface ZYTableController ()

@end

@implementation ZYTableController
{
    NSArray *titleArray;
    NSArray *controllerNameArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    titleArray = @[
                   @"ZYWebViewController",
                   @"ZYFaceIDcontroller",
                   @"ZYSystemShare",
                   @"TestController"
                   ];
    controllerNameArray = @[
                            @"ZYWebViewController",
                            @"ZYFaceViewController",
                            @"ZYSystemShareController",
                            @"ZYTestViewController"
                            ];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"roottablecell" forIndexPath:indexPath];
    cell.textLabel.text = titleArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UIViewController *controller = [[NSClassFromString(controllerNameArray[indexPath.row]) alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
