//
//  ZYUniversalModel.h
//  sunt6
//
//  Created by yong on 2018/9/11.
//  Copyright © 2018年 MrZhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@class ZYWdMessageCountModel;

@interface YGActivityModel : NSObject
{
    int  haha;
}

@property (assign, nonatomic,getter=returnFlag)  NSInteger flag;

@property (assign)  BOOL tag;

@property (assign, nonatomic)  CGFloat score;


@property (copy,   nonatomic)  NSString *activityImageUrl;

@property (strong, nonatomic)  NSNumber *numberTest;
//@"SHAREPICURL"
@property (strong, nonatomic)  ZYWdMessageCountModel *countModel;


@property (retain, nonatomic)  NSDate *date;



@property (strong, nonatomic)  NSArray *arrayTest;


@property (strong, nonatomic)  NSMutableSet *setTest;

@property (strong, nonatomic)  NSMutableArray *mutableArray;

@property (strong, nonatomic,readwrite)  NSDictionary *dicTest;

@property (strong, atomic)  NSMutableDictionary  *mutableDic;

@property (strong, nonatomic,readonly)  NSURL *urlTest;


-(void)updateDataWith:(NSString*)flag andDataModel:(YGActivityModel*)model;

-(void)requestDataFromService;

@end


@interface ZYWdMessageCountModel : YGActivityModel

@property (assign, nonatomic)  NSInteger driveWDCount; //安全驾驶未读消息
@property (assign, nonatomic)  NSInteger hotWDCount;    //热门活动未读消息
@property (assign, nonatomic)  NSInteger noticeWDCount;//系统消息未读消息
@end


@interface  YGMiniProgramModel : NSObject
@property (copy,   nonatomic)  NSString *userName;
@property (copy,   nonatomic)  NSString *path;
@end
