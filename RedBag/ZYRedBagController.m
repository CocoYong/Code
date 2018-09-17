//
//  ZYRedBagController.m
//  sunt6
//
//  Created by yong on 2018/7/9.
//  Copyright © 2018年 MrZhang. All rights reserved.
//

#import "ZYRedBagController.h"
#import "ZYMineNetworkTools.h"

#import "IQKeyboardManager.h"

#import "ZYUpcaseNumPadView.h"

#define ITEMPADDING 40
@interface ZYRedBagController ()<UITextFieldDelegate,ButtClickDelegate>
@property (strong, nonatomic)  UIView *tuiGuangMaView;
@property (strong, nonatomic)  UILabel *tuiGuangMaLabel;
@property (copy,   nonatomic)  NSString *verifiCode;
@property (strong, nonatomic)  ZYMineNetworkTools *mineNetTools;

@property (strong, nonatomic)  ZYUpcaseNumPadView *textPutView;

@property (strong, nonatomic)  UITextField *markTextField;
@end

@implementation ZYRedBagController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"推广人员推广码";
	_verifiCode = @"";
	
	//creatUI
	[self configeUIData];
	
	self.verifiCode = @"";
	
	[self requestTuiGuangMa];
	
	
	//设置隐藏toolbar
	[IQKeyboardManager sharedManager].enableAutoToolbar = NO;
	
	//隐藏键盘手势
	UITapGestureRecognizer *tapRecognicer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
	[self.view addGestureRecognizer:tapRecognicer];
	
}
-(ZYUpcaseNumPadView *)textPutView
{
	if (_textPutView==nil) {
		_textPutView = [[ZYUpcaseNumPadView alloc] initWithFrame:CGRectMake(0, 0, MY_WIHTE, 200) inputViewStyle:UIInputViewStyleKeyboard];
		_textPutView.allowsSelfSizing = YES;
		_textPutView.delegate = self;
	}
	return _textPutView;
}
-(void)hideKeyboard
{
	[self.view endEditing:YES];
}

-(void)configeUIData
{
	UILabel *showingLabel = [[UILabel alloc]initWithFrame:CGRectMake(MY_WIHTE/2-150, 60, 300, 22)];
	showingLabel.text = @"请输入4位口令秘钥";
	showingLabel.textAlignment = NSTextAlignmentCenter;
	showingLabel.textColor = [UIColor darkGrayColor];
	showingLabel.font = [UIFont systemFontOfSize:14];
	[self.view addSubview:showingLabel];
	
	CGFloat itemWidth = (MY_WIHTE -ITEMPADDING*5)/4;
	for (int i=0; i<4; i++) {
		
		UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(ITEMPADDING + i*(ITEMPADDING+itemWidth), 100, itemWidth, itemWidth+20)];
		textField.delegate = self;
		textField.tag = i+100;
		textField.layer.borderColor = [HelperUtil colorWithHexString:@"#CBCBCB"].CGColor;
		textField.layer.borderWidth = 1.0f;
		textField.layer.cornerRadius = 2.0f;
		textField.font = [UIFont systemFontOfSize:35];
		[textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		textField.borderStyle = UITextBorderStyleNone;
		textField.keyboardType = UIKeyboardTypeNamePhonePad;
		textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, CGRectGetHeight(textField.frame))];
		textField.leftViewMode = UITextFieldViewModeAlways;
		
		textField.textColor = [UIColor blackColor];
		textField.tintColor = [UIColor clearColor];
		textField.inputView = self.textPutView;
		[self.view addSubview:textField];
		
		/*
		UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(ITEMPADDING + i*(ITEMPADDING+itemWidth), 100, itemWidth, itemWidth+20)];
		numLabel.tag = textField.tag*2;
		numLabel.textAlignment = NSTextAlignmentCenter;
		numLabel.textColor = [UIColor blackColor];
		numLabel.font = [UIFont boldSystemFontOfSize:35];
		[self.view addSubview:numLabel];
		 */
	}
	
	//MARK: 显示推广二维码的view
	_tuiGuangMaView = [[UIView alloc]initWithFrame:self.view.bounds];
	_tuiGuangMaView.hidden = YES;
	_tuiGuangMaView.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:_tuiGuangMaView];
	
	
	UILabel *myTuiGuangMaLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	myTuiGuangMaLabel.textAlignment = NSTextAlignmentCenter;
	myTuiGuangMaLabel.text = @"我的推广码";
	myTuiGuangMaLabel.textColor = [UIColor darkGrayColor];
	[_tuiGuangMaView addSubview:myTuiGuangMaLabel];
	

	
	_tuiGuangMaLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	_tuiGuangMaLabel.textAlignment = NSTextAlignmentCenter;
	_tuiGuangMaLabel.font = [UIFont boldSystemFontOfSize:50];
	
	[_tuiGuangMaView addSubview:_tuiGuangMaLabel];

	UIButton *copyButt = [UIButton buttonWithType:UIButtonTypeCustom];
	[copyButt setTitle:@"复制" forState:UIControlStateNormal];
	[copyButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	copyButt.layer.borderColor = [UIColor lightGrayColor].CGColor;
	copyButt.layer.borderWidth = 1.0f;
	copyButt.layer.cornerRadius = 20;
	[copyButt addTarget:self action:@selector(copyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
	[_tuiGuangMaView addSubview:copyButt];
	
	[myTuiGuangMaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(_tuiGuangMaView);
		make.top.equalTo(_tuiGuangMaView.mas_top).offset(100);
	}];
	[_tuiGuangMaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(_tuiGuangMaView);
		make.top.equalTo(myTuiGuangMaLabel.mas_bottom).offset(30);
	}];
	[copyButt mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(_tuiGuangMaView);
		make.width.mas_equalTo(@80);
		make.height.mas_equalTo(@40);
		make.top.equalTo(_tuiGuangMaLabel.mas_bottom).offset(30);
	}];
	[_tuiGuangMaView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self.view);
	}];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
	self.markTextField = textField;
}
-(void)getVerifyCode
{
	_verifiCode = @"";
	//得到推广码
	for (UIView *view in self.view.subviews) {
		if ([view isKindOfClass:[UITextField class]]) {
			UITextField *tempTextfield = (UITextField*)view;
			NSLog(@"verifycode == %@",_verifiCode);
			_verifiCode = [@"" stringByAppendingFormat:@"%@%@",_verifiCode,tempTextfield.text];
		}
	}
	if (_verifiCode.length<4) {
		return;
	}
	NSLog(@"verifycode ===%@",_verifiCode);
	//请求推广码
	[self requestTuiGuangMa];
}
-(void)alphaAndNumClicked:(NSString *)passString
{
	UITextField *textfield = self.markTextField;
	if (!passString) {
		textfield.text = nil;
		if (textfield.tag>100) {
			UITextField *tempTextField = [self.view viewWithTag:textfield.tag-1];
			[tempTextField becomeFirstResponder];
		}
	}else
	{
		textfield.text = passString;
		textfield.text = [textfield.text substringToIndex:1];
		if (textfield.tag<103) {
			UITextField *tempTextField = [self.view viewWithTag:textfield.tag+1];
			if (tempTextField.text.length>0) {
				[textfield resignFirstResponder];
			}else
			{
				[textfield resignFirstResponder];
				[tempTextField becomeFirstResponder];
			}
		}
	}
	//获取秘钥
	[self getVerifyCode];
}
-(void)requestTuiGuangMa
{
	NSMutableDictionary  *parasDic = [NSMutableDictionary dictionaryWithDictionary:@{@"actionType":@"getEarthpushCodeByOwnerCode",@"EarthpushKey":self.verifiCode}];
	[self.mineNetTools redBagActivityWithUrl:RedEnvelopesServlet andParamasDic:parasDic block:^(id json) {
		if ([json isKindOfClass:[NSDictionary class]]) {
			NSDictionary *tempDic  =(NSDictionary*)json;
			if ([[tempDic[@"result"] objectForKey:@"code"] integerValue]==0) {
				_tuiGuangMaLabel.text = [tempDic[@"result"] objectForKey:@"msg"];
				self.tuiGuangMaView.hidden = NO;
				self.title = @"地推人员推广码";
			}else
			{
				self.tuiGuangMaView.hidden = YES;
				if (![self.verifiCode isEqualToString:@""]) {
					[[Tostal sharTostal] lowTostalMesg:[tempDic[@"result"] objectForKey:@"msg"] tostalTime:1.5];
				}
			}
		}
	}];
}

/*
-(BOOL)checkIsFinishEditting
{
	NSInteger  notInputTextFieldNum = 0;
	for (UIView *view in self.view.subviews) {
		if ([view isKindOfClass:[UITextField class]]) {
			UITextField *tempTextfield = (UITextField*)view;
			if (tempTextfield.text==nil) {
				[tempTextfield becomeFirstResponder];
				notInputTextFieldNum += 1;
			}
		}
	}
	if (notInputTextFieldNum==0) {
		return YES;
	}else
	{
		return NO;
	}
}
-(BOOL)checkIsDeleteClear
{
	BOOL  isDeletClear = NO;
	for (UIView *view in self.view.subviews) {
		if ([view isKindOfClass:[UITextField class]]) {
			UITextField *tempTextfield = (UITextField*)view;
			if (tempTextfield.text!=nil) {
				[tempTextfield becomeFirstResponder];
				isDeletClear = NO;
				break;
			}else
			{
				isDeletClear = YES;
			}
		}
	}
	return isDeletClear;
}
*/

#pragma mark ----------->>>>>>>>>>我的二维码页面方法<<<<<<<<<<----------

-(void)copyButtonAction:(UIButton*)butt
{
	UIPasteboard  *paseboard = [UIPasteboard generalPasteboard];
	[paseboard setString:_tuiGuangMaLabel.text];
	[[Tostal sharTostal] lowTostalMesg:@"复制成功" tostalTime:1.5];
}
-(ZYMineNetworkTools *)mineNetTools
{
	if (_mineNetTools==nil) {
		_mineNetTools = [ZYMineNetworkTools new];
	}
	return _mineNetTools;
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
