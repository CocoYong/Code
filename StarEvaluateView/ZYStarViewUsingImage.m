//
//  ZYStarViewUsingImage.m
//  OnlineTutoring
//
//  Created by yong zhang on 2018/6/6.
//  Copyright © 2018年 yong zhang. All rights reserved.
//

#import "ZYStarViewUsingImage.h"

@implementation ZYStarViewUsingImage

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
	if (self = [super initWithCoder:aDecoder]) {
		
		[self propertiesInit];
		
		[self  createSubImageViewWithStarNum];
	}
	return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		
		[self propertiesInit];
		
		[self  createSubImageViewWithStarNum];
		
	}
	return self;
}
-(void)propertiesInit
{
	self.starSize = CGSizeMake(10, 10);
	self.padding = 5;
	self.starNum = 5;
	self.defaultValue = 0;
	self.defaultImage = [UIImage imageNamed:@"mid-star-black"];
	self.selectImage = [UIImage imageNamed:@"mid-star-nor"];
}
-(void)createSubImageViewWithStarNum
{
	for (int i=0; i<self.starNum; i++) {
		UIImageView *starView = [[UIImageView alloc]initWithFrame:CGRectMake((self.padding+self.starSize.width)*i, (self.bounds.size.height-self.starSize.height)/2, self.starSize.width, self.starSize.height)];
		starView.userInteractionEnabled = YES;
		starView.tag = i;
		starView.image = self.defaultImage;
		[self addSubview:starView];
		if (i==self.starNum-1) {
		self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, CGRectGetMaxX(starView.frame), self.frame.size.height);
		}
	}
}
-(void)setDefaultValue:(NSInteger)defaultValue
{
	_defaultValue = defaultValue;
	for (UIImageView *imageView in self.subviews) {
		if (imageView.tag<_defaultValue) {
		imageView.image = self.selectImage;
		}else
		{
		 imageView.image = self.defaultImage;
		}
	}
}
-(void)setPadding:(CGFloat)padding
{
	_padding = padding;
	[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
	[self createSubImageViewWithStarNum];
}
-(void)setStarSize:(CGSize)starSize
{
	_starSize = starSize;
	[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
	[self createSubImageViewWithStarNum];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	if (touch.view.tag == 0) {     //如果没点到星星上就直接返回不用管了
		return;
	}
	for (UIImageView *imageView in self.subviews) {
		if (imageView.tag<=touch.view.tag) {
			imageView.image = self.selectImage;
		}else
		{
			imageView.image = self.defaultImage;
		}
	}
	if (self.changeBlock) {
		self.changeBlock(touch.view.tag+1);
	}
}
@end
