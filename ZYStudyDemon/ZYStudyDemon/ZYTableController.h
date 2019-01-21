//
//  ZYTableController.h
//  ZYStudyDemon
//
//  Created by yong zhang on 2018/6/28.
//  Copyright © 2018年 yong zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYTableController : UITableViewController
@property (nonatomic, copy) NSString *testString;
@property (nonatomic, assign) NSInteger testInteger;
@property (nonatomic, assign) CGFloat  testFloat;
@property (nonatomic, assign) double  testDouble;
@property (nonatomic, assign) BOOL testBool;
@property(nonatomic, strong)  NSArray *testArray;

@end
