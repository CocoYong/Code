//
//  ZYStarViewUsingImage.h
//  OnlineTutoring
//
//  Created by yong zhang on 2018/6/6.
//  Copyright © 2018年 yong zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ValueChangeBlock)(NSInteger value);


@interface ZYStarViewUsingImage : UIView

//星星尺寸大小
@property (assign, nonatomic)  CGSize starSize;

//每个星星之间的间隔
@property (assign, nonatomic)  CGFloat padding;

//starNum 默认为5个星星
@property (assign, nonatomic)  NSInteger starNum;

//默认红星数
@property (assign, nonatomic)  NSInteger defaultValue;

//默认图片
@property (strong, nonatomic)  UIImage *defaultImage;

//选中image
@property (strong, nonatomic)  UIImage *selectImage;

//starValue  - 用户点击星星后用来获得评价的星星数
@property (assign, nonatomic)  NSInteger starValue;

@property (copy, nonatomic)  ValueChangeBlock changeBlock;

-(instancetype)initWithFrame:(CGRect)frame;
@end
