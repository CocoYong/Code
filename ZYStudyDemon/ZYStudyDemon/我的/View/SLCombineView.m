//
//  SLCombineView.m
//  ZYStudyDemon
//
//  Created by yong on 2020/2/20.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#import "SLCombineView.h"

@implementation SLCombineView
-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _imageView;
}
-(UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    }
    return _textLabel;
}
-(UIButton *)touchButton
{
    if (!_touchButton) {
        _touchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _touchButton;
}

@end
