//
//  SystemShareController.m
//  ZYStudyDemon
//
//  Created by yong zhang on 2018/6/28.
//  Copyright © 2018年 yong zhang. All rights reserved.
//
// 系统分享实现
#import "ZYSystemShareController.h"
#import <Social/Social.h>
#import "ZYActivity.h"
@interface ZYSystemShareController ()
@property (strong, nonatomic) IBOutlet UIView *testViewOne;
@property (strong, nonatomic) IBOutlet UIView *testViewTwo;

@end

@implementation ZYSystemShareController

- (void)viewDidLoad {
    [super viewDidLoad];
	
}
- (IBAction)shareButtonAction:(UIButton *)sender {
	
	NSString *text = @"hello world";
	UIImage * image = [UIImage imageNamed:@"head_bg"];
	NSURL *shareURL = [NSURL URLWithString:@"www.baidu.com"];
	NSArray *activityItems = @[text,image,shareURL];
	
	ZYActivity *activity = [[ZYActivity alloc]init];
	NSArray  *activityArray = @[activity];
	
	UIActivityViewController *activityController = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:activityArray];
	activityController.excludedActivityTypes = @[UIActivityTypePostToFlickr,UIActivityTypePostToVimeo,UIActivityTypePostToTwitter,UIActivityTypePostToFacebook,UIActivityTypeAirDrop];
	UIActivityViewControllerCompletionWithItemsHandler myBlock = ^(UIActivityType __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError) {
		if (completed){
			NSLog(@"completed");
		}
	};
	activityController.completionWithItemsHandler = myBlock;
	[self presentViewController:activityController animated:YES completion:nil];
}

- (IBAction)shareTwoButtonAction:(UIButton *)sender {
	
		/* 11.0之后不能用
			SLServiceTypeTwitter
			SLServiceTypeFacebook
			SLServiceTypeSinaWeibo
			SLServiceTypeTencentWeibo
			SLServiceTypeLinkedIn
		 */
//	NSString *socialType = @"com.tencent.xin.sharetimeline";
//	SLComposeViewController *composeVc = [SLComposeViewController composeViewControllerForServiceType:socialType];

//	//创建分享的控制器
	SLComposeViewController *composeVc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
	
	if (composeVc == nil){
		NSLog(@"未安装软件");
		return;
	}
	if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
		NSLog(@"软件未配置登录信息");
		return;
	}
	
	//添加分享的文字、图片、链接
	[composeVc setInitialText:@"要分享的文本内容"];
	[composeVc addImage:[UIImage imageNamed:@"head_bg"]];
	[composeVc addURL:[NSURL URLWithString:@"http://www.baidu.com"]];
	
	
	//监听用户点击了取消还是发送
		composeVc.completionHandler = ^(SLComposeViewControllerResult result){
			if (result == SLComposeViewControllerResultCancelled) {
				NSLog(@"点击了取消");
			} else {
				NSLog(@"点击了发送");
			}
		};
	
	//弹出分享控制器
	[self presentViewController:composeVc animated:YES completion:nil];

}

- (IBAction)shareThreeButtAction:(UIButton *)sender {
    
    
   
//    UIView *testView = [[UIView alloc]initWithFrame:self.navigationController.view.bounds];
//    testView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
//
//    UIView *popView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    popView.backgroundColor = [UIColor redColor];
//    [testView addSubview:popView];
//
//
//    [self.navigationController.view addSubview:testView];
//
    
    self.testViewOne.frame = CGRectMake(0, 0, 200, 200);
    [[UIApplication sharedApplication].keyWindow addSubview:self.testViewOne];
    
    self.testViewTwo.frame = CGRectMake(100, 100, 300, 300);
     [[UIApplication sharedApplication].keyWindow addSubview:self.testViewTwo];
    
    self.testViewOne.frame = CGRectMake(300, 300, 200, 200);
    [[UIApplication sharedApplication].keyWindow addSubview:self.testViewOne];
    
}




- (void)didReceiveMemoryWarning {
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
