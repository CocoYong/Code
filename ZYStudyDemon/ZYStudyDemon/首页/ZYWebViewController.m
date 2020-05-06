//
//  WebViewController.m
//  ZYStudyDemon
//
//  Created by yong on 2018/12/28.
//  Copyright © 2018 yong zhang. All rights reserved.
//

#import "ZYWebViewController.h"
#import <WebKit/WebKit.h>

#import "ZYLocationManager.h"

@interface ZYWebViewController ()<UIWebViewDelegate, WKUIDelegate, WKNavigationDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic)  WKWebView *wkWebView;
@property (strong, nonatomic)  WKWebViewConfiguration *confige;
@property (strong, nonatomic) IBOutlet UIView *buttBgView;
@property (copy,   nonatomic)  NSString *loadingUrl;

@end

@implementation ZYWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //设置loadingurl
    self.loadingUrl = @"https://www.baidu.com";

    [self  createRightItem];
}

- (void)createRightItem
{
    UIButton *rightButt = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButt.frame = CGRectMake(0, 0, 50, 30);
    [rightButt setTitle:@"重新加载" forState:UIControlStateNormal];
    [rightButt setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [rightButt addTarget:self action:@selector(showButtView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttItem = [[UIBarButtonItem alloc]initWithCustomView:rightButt];
    self.navigationItem.rightBarButtonItem = buttItem;

    self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:self.confige];
    self.wkWebView.UIDelegate = self;
    self.wkWebView.navigationDelegate = self;
    [self.view insertSubview:self.wkWebView atIndex:0];

    [self.wkWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)showButtView
{
    self.buttBgView.hidden = NO;
}

- (WKWebViewConfiguration *)confige
{
    if (!_confige) {
        _confige = [[WKWebViewConfiguration alloc]init];
    }
    return _confige;
}

- (IBAction)webViewAction:(UIButton *)sender
{
    self.buttBgView.hidden = YES;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.loadingUrl]]];

    [ZYLocationManager startUpdateLocationIsOnlyNeedLocations:NO andCallBackBlock:^(CLLocation *location, ZYLocationModel *locationModel, NSError *error) {
        NSLog(@"location====%@\naddressDic===%@", location, locationModel.province);
    }];
}

- (IBAction)wkWebView:(UIButton *)sender
{
    self.buttBgView.hidden = YES;
    self.webView.hidden = YES;
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.loadingUrl]]];
}

//MARK: - webViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
}

//MARK: - WkWebviewDelegate
//WKUIDelegate
//- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
//{
//
//}

//WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation
{
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
}

//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler
//{
//
//}
@end
