//
//  ZYLocationManager.h
//  ZYStudyDemon
//
//  Created by yong on 2018/12/28.
//  Copyright © 2018 yong zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@class ZYLocationModel;

typedef void(^LocationBlock)(CLLocation *location,ZYLocationModel *locationModel,NSError *error);

NS_ASSUME_NONNULL_BEGIN

@interface ZYLocationManager : NSObject


/**
 单次定位

 @param onlyNeedLocations 是否只需要location
 @param locationBlock 回调block
 */
+(void)startUpdateLocationIsOnlyNeedLocations:(BOOL)onlyNeedLocations andCallBackBlock:(LocationBlock)locationBlock;



/**
 多次定位

 @param times 定位次数
 @param locationBlock 回调block
 */
+(void)startUpdateLocationTimes:(NSInteger)times andCallBack:(LocationBlock)locationBlock;

@end

NS_ASSUME_NONNULL_END




@interface ZYLocationModel:NSObject
@property (copy,   nonatomic)  NSString *fullAddress; //全部地址 eg:中国河北省石家庄市XX县XXXX
@property (copy,   nonatomic)  NSString *province; //省  eg：北京市/ 陕西省/河北省
@property (copy,   nonatomic)  NSString *city; //市   eg:北京市 西安市  石家庄市
@property (copy,   nonatomic)  NSString *subCity; //区或者县  eg:丰台区/大荔县
@property (copy,   nonatomic)  NSString *detailAddress; //详细地址 eg:XXX街道XXX办事处
@property (strong, nonatomic)  CLLocation *location;//经纬度 海拔等信息
@property (copy,   nonatomic)  NSString *postCode;//邮编
@property (copy,   nonatomic)  NSString *twoLevelInstitutions; //二级机构
@property (copy,   nonatomic)  NSString *threeLevelInstitutions; //三级机构
@end
