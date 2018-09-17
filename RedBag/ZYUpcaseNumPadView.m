//
//  ZYUpcaseNumPadView.m
//  sunt6
//
//  Created by yong on 2018/8/9.
//  Copyright © 2018年 MrZhang. All rights reserved.
//

#import "ZYUpcaseNumPadView.h"

#define ALPHAITEMPADDING 3

@implementation ZYUpcaseNumPadView

-(instancetype)initWithFrame:(CGRect)frame inputViewStyle:(UIInputViewStyle)inputViewStyle
{
	if (self = [super initWithFrame:frame inputViewStyle:inputViewStyle]) {
		[self createUpperCaseAlphaAndNumItems];
	}
	return self;
}

-(void)createUpperCaseAlphaAndNumItems
{
	
  NSArray *alphaArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@"Q",@"W",@"E",@"R",@"T",@"Y",@"U",@"I",@"O",@"P",@"A",@"S",@"D",@"F",@"G",@"H",@"J",@"K",@"L",@"Z",@"X",@"C",@"V",@"B",@"N",@"M",@""];
	CGFloat	alphaItemWidth = (MY_WIHTE - 11*ALPHAITEMPADDING) / 10;
	CGFloat alphaItemHeight = alphaItemWidth *1.3;
	
	for (int i = 0; i<4; i++) {
		if (i==2) {
			for (int j = 0; j<9; j++) {
				UIButton *alphaButt = [UIButton buttonWithType:UIButtonTypeCustom];
				alphaButt.frame = CGRectMake(j*(alphaItemWidth+ALPHAITEMPADDING)+ALPHAITEMPADDING+alphaItemWidth/2, i*(alphaItemHeight+ALPHAITEMPADDING)+ALPHAITEMPADDING, alphaItemWidth, alphaItemHeight);
				[alphaButt setTitle:alphaArray[(i*10)+j] forState:UIControlStateNormal];
				[alphaButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
				alphaButt.backgroundColor = [UIColor whiteColor];
				alphaButt.layer.cornerRadius = 3.0f;
				[alphaButt addTarget:self action:@selector(alphaAndNumButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
				[self addSubview:alphaButt];
			}
		}else if (i==3)
		{
			for (int j = 0; j<8; j++) {
				UIButton *alphaButt = [UIButton buttonWithType:UIButtonTypeCustom];
				alphaButt.frame = CGRectMake((j+1)*(alphaItemWidth+ALPHAITEMPADDING)+ALPHAITEMPADDING, i*(alphaItemHeight+ALPHAITEMPADDING)+ALPHAITEMPADDING, alphaItemWidth, alphaItemHeight);
				[alphaButt setTitle:alphaArray[(i*10)-1+j] forState:UIControlStateNormal];
				[alphaButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
				alphaButt.backgroundColor = [UIColor whiteColor];
				alphaButt.layer.cornerRadius = 3.0f;
				[alphaButt addTarget:self action:@selector(alphaAndNumButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
				[self addSubview:alphaButt];
				if (j==7) {
					[alphaButt setImage:[UIImage imageNamed:@"delete_black"] forState:UIControlStateNormal];
					alphaButt.frame = CGRectMake(alphaButt.frame.origin.x, alphaButt.frame.origin.y, alphaItemWidth*3/2, alphaItemHeight);
				}
				self.frame = CGRectMake(0, 0, MY_WIHTE, CGRectGetMaxY(alphaButt.frame)+ALPHAITEMPADDING);
			}
		}
		else
		{
			for (int j = 0; j<10; j++) {
				UIButton *alphaButt = [UIButton buttonWithType:UIButtonTypeCustom];
				alphaButt.frame = CGRectMake(j*(alphaItemWidth+ALPHAITEMPADDING)+ALPHAITEMPADDING, i*(alphaItemHeight+ALPHAITEMPADDING)+ALPHAITEMPADDING, alphaItemWidth, alphaItemHeight);
				[alphaButt setTitle:alphaArray[(i*10)+j] forState:UIControlStateNormal];
				[alphaButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
				alphaButt.backgroundColor = [UIColor whiteColor];
				alphaButt.layer.cornerRadius = 3.0f;
				[alphaButt addTarget:self action:@selector(alphaAndNumButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
				[self addSubview:alphaButt];
			}
		}
	}
}

-(void)alphaAndNumButtonClicked:(UIButton*)clickedButt
{
	if (self.delegate&&[self.delegate respondsToSelector:@selector(alphaAndNumClicked:)]) {
		[self.delegate alphaAndNumClicked:clickedButt.titleLabel.text];
	}
}
@end
