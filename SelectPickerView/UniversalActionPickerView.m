//
//  UniversalActionPickerView.m
//  JiuYiKang
//
//  Created by yong zhang on 2017/11/28.
//  Copyright © 2017年 MrZhang. All rights reserved.
//

#import "UniversalActionPickerView.h"

@interface UniversalActionPickerView()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)UIView *whiteAlertView;
@property(nonatomic,strong)NSArray *pickerDataSource;
@property(nonatomic,strong)UIViewController *controller;
@property(nonatomic,copy)PhotoCallBackBlock passPhotoBlock;
@property(nonatomic,copy)PickerDataBlock pickerDataBlock;
@property(nonatomic,strong)UIView *halfGrayView;
@property(nonatomic,copy)NSString *markString;
@end
@implementation UniversalActionPickerView

-(instancetype)initWithFrame:(CGRect)frame andController:(id)showPhotoController andCallBackBlock:(PhotoCallBackBlock)block
{
    self=[super initWithFrame:frame];
    if (!self) return nil;
    self.controller=(UIViewController*)showPhotoController;
    self.passPhotoBlock = block;
    self.backgroundColor=[UIColor clearColor];
    self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    _halfGrayView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    _halfGrayView.backgroundColor=[UIColor darkGrayColor];
    _halfGrayView.alpha=0.5f;
    [self addSubview:_halfGrayView];
    
    _whiteAlertView=[[UIView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT-200, SCREENWIDTH, 200)];
    _whiteAlertView.backgroundColor=[UIColor whiteColor];
    [self addSubview:_whiteAlertView];
    
    
    UIButton *cameraButt=[UIButton buttonWithType:UIButtonTypeCustom];
    [cameraButt setTitle:@"Camera" forState:UIControlStateNormal];
    cameraButt.layer.cornerRadius=5;
	
//    cameraButt.layer.borderColor=[UIColor redColor].CGColor;
	cameraButt.backgroundColor = [UtilitiesHelper colorWithHexString:@"#A167FF"];

    [cameraButt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cameraButt addTarget:self action:@selector(cameraButtAction:) forControlEvents:UIControlEventTouchUpInside];
    cameraButt.frame=CGRectMake(10, 20, SCREENWIDTH-20, 40);
    [_whiteAlertView addSubview:cameraButt];
    
    UIButton *libraryButt=[UIButton buttonWithType:UIButtonTypeCustom];
    [libraryButt setTitle:@"Photos" forState:UIControlStateNormal];
    libraryButt.layer.cornerRadius=5;
//    libraryButt.layer.borderColor=[UIColor redColor].CGColor;
	libraryButt.backgroundColor = [UtilitiesHelper colorWithHexString:@"#A167FF"];
    [libraryButt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [libraryButt addTarget:self action:@selector(libraryButtAction:) forControlEvents:UIControlEventTouchUpInside];
    libraryButt.frame=CGRectMake(10, 80, SCREENWIDTH-20, 40);
    [_whiteAlertView addSubview:libraryButt];
    
    
    UIButton *cancelButt=[UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButt setTitle:@"Cancel" forState:UIControlStateNormal];
	cancelButt.layer.cornerRadius = 5;
    [cancelButt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelButt setBackgroundColor:[UtilitiesHelper colorWithHexString:@"#53B262"]];
    [cancelButt addTarget:self action:@selector(cancelButtAction:) forControlEvents:UIControlEventTouchUpInside];
    cancelButt.frame=CGRectMake(10, 140, SCREENWIDTH-20, 40);
    [_whiteAlertView addSubview:cancelButt];
    return self;
}
-(void)cameraButtAction:(UIButton*)butt
{
    self.hidden=YES;
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self.controller presentViewController:imagePickerController animated:YES completion:^{}];
}
-(void)libraryButtAction:(UIButton*)butt
{
    self.hidden=YES;
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self.controller presentViewController:imagePickerController animated:YES completion:^{}];
}
-(void)cancelButtAction:(UIButton*)butt
{
    [self removeFromSuperview];
}
-(void)showView
{
	if (self.hidden) {
		self.hidden = NO;
	}else
	{
		 [[UIApplication sharedApplication].keyWindow addSubview:self];
	}
}
#pragma mark - ---------->>>>>>>>>>photoDelegate<<<<<<<<<<----------

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
	[picker dismissViewControllerAnimated:YES completion:^{
        UIImage *imageEdit = [info objectForKey:UIImagePickerControllerEditedImage];
        NSString *urlString = [NSString stringWithFormat:@"%@",[info objectForKey:UIImagePickerControllerReferenceURL]];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // 设置时间格式
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *newTempUrl = @"";
        NSRange range = [urlString rangeOfString:@"PNG"];
        if (range.length) {
            newTempUrl = [NSString stringWithFormat:@"%@.png",str];
        }else{
            newTempUrl = [NSString stringWithFormat:@"%@.jpg",str];
        }
        [self uploadImageToService:imageEdit andImageName:newTempUrl];
	 }];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)uploadImageToService:(UIImage*)editImage andImageName:(NSString*)imageName
{
    [ZYDataRequest upLoadPhotoImageToSerVice:[NSString stringWithFormat:@"%@/api/saveAvator",KBaseURL]
                                  andUIImage:editImage
                                       block:^(NSObject *result) {
                                NSDictionary *dict=(NSDictionary*)result;
                                NSString *imageUri=[[dict objectForKey:@"data"] objectForKey:@"path"];
                                self.passPhotoBlock(editImage, imageUri,nil);
                                [self removeFromSuperview];
                                              }
                                  errorBlock:^(NSError *error) {
                                                  self.passPhotoBlock(nil, nil, error);
                                                  [self removeFromSuperview];
                                              }];
//    NSData *imageData=UIImageJPEGRepresentation(editImage, 0);
//    NSDictionary *parames=@{@"token":MYGETNSUSERDEFAULTSDEFINE(@"token"),@"upload_file":imageName};
//    [ZYDataRequest uploadFileToServiceWithUrl:@"AppApi/Org/upload"  andFileNamed:@"upload_file"
//                                      andName:imageName andFileData:imageData params:parames block:^(NSObject *result) {
//                                          NSDictionary *dict=(NSDictionary*)result;
//                                          NSString *imageUri=[[dict objectForKey:@"data"] objectForKey:@"file"];
//                                          self.passPhotoBlock(editImage, imageUri,nil);
//                                          [self removeFromSuperview];
//                                      } errorBlock:^(NSError *error) {
//                                          self.passPhotoBlock(nil, nil, error);
//                                          [self removeFromSuperview];
//                                      } noNetWorking:^(NSString *noNetWorking) {
//
//                                      }];
    
}

#pragma mark - ---------->>>>>>>>>>弹出选择框<<<<<<<<<<----------
-(instancetype)initWithFrame:(CGRect)frame andDataSource:(NSArray*)dataArray andConfigeBlock:(PickerConfigeBlock)configeBlock andCallBackBlock:(PickerDataBlock)block
{
    self=[super initWithFrame:frame];
    if (!self) return nil;
    self.pickerDataSource=dataArray;
    self.pickerDataBlock = block;
    self.backgroundColor=[UIColor clearColor];
    self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    _halfGrayView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    _halfGrayView.backgroundColor=[UIColor darkGrayColor];
    _halfGrayView.alpha=0.5f;
    [self addSubview:_halfGrayView];
    
    _whiteAlertView=[[UIView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT-256, SCREENWIDTH, 256)];
    _whiteAlertView.backgroundColor=[UIColor whiteColor];
    [self addSubview:_whiteAlertView];
    
    UIPickerView *defaultPicker=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 40, SCREENWIDTH, 216)];
    defaultPicker.delegate=self;
    defaultPicker.dataSource=self;
	defaultPicker.tag = 11111;
    defaultPicker.backgroundColor=[UtilitiesHelper colorWithHexString:@"#EDEDED"];
    [_whiteAlertView addSubview:defaultPicker];
	if (configeBlock) {
		configeBlock(defaultPicker);
	}
//    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(-1, CGRectGetMidY(defaultPicker.bounds)-20, SCREENWIDTH+2, 40)];
//    lineView.backgroundColor=[UIColor clearColor];
//    lineView.layer.borderWidth=0.5;
//    lineView.layer.borderColor=[UtilitiesHelper colorWithHexString:@"#CCCCCC"].CGColor;
//    [defaultPicker addSubview:lineView];
    
    UIButton *sureButt=[UIButton buttonWithType:UIButtonTypeCustom];
    [sureButt setTitle:@"确定" forState:UIControlStateNormal];
    [sureButt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    sureButt.titleLabel.font=[UIFont systemFontOfSize:15];
    [sureButt addTarget:self action:@selector(sureButtAction:) forControlEvents:UIControlEventTouchUpInside];
    sureButt.frame=CGRectMake(SCREENWIDTH-70, 10, 60, 30);
    [_whiteAlertView addSubview:sureButt];
    
    
    UIButton *cancelButt=[UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButt setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [cancelButt addTarget:self action:@selector(cancelButtAction:) forControlEvents:UIControlEventTouchUpInside];
    cancelButt.titleLabel.font=[UIFont systemFontOfSize:15];
    cancelButt.frame=CGRectMake(10, 10, 60, 30);
    [_whiteAlertView addSubview:cancelButt];
    return self;
}
-(void)sureButtAction:(UIButton*)tempButt
{
    if (self.markString==nil)
    {
		NSInteger  rowIndex =[(UIPickerView*)[self viewWithTag:11111]  selectedRowInComponent:0];
      self.pickerDataBlock([NSString stringWithFormat:@"%@",[self.pickerDataSource objectAtIndex:rowIndex]], nil);
    }else
    {
        self.pickerDataBlock(self.markString, nil);
    }
    [self removeFromSuperview];
}
#pragma mark--------pickerViewDelegate---------
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return self.pickerDataSource.count;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([[self.pickerDataSource objectAtIndex:row] isKindOfClass:[NSString class]]) {
     return [self.pickerDataSource objectAtIndex:row];
    }else
    {
        return  [NSString stringWithFormat:@"%@",[self.pickerDataSource objectAtIndex:row]];
    }
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([[self.pickerDataSource objectAtIndex:row] isKindOfClass:[NSString class]]) {
        self.markString= [self.pickerDataSource objectAtIndex:row];
    }else
    {
      self.markString=[NSString stringWithFormat:@"%@",[self.pickerDataSource objectAtIndex:row]];
    }
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:14]];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}
@end
