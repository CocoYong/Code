//
//  ZYLocationManager.m
//  ZYStudyDemon
//
//  Created by yong on 2018/12/28.
//  Copyright © 2018 yong zhang. All rights reserved.
//

#import "ZYLocationManager.h"
#import <UIKit/UIKit.h>

@interface ZYLocationManager ()<CLLocationManagerDelegate>

@property (strong, nonatomic)  CLLocationManager *locationManager;

@property (strong, nonatomic)  CLGeocoder *geoCoder;

@property (copy, nonatomic) LocationBlock localBlock;

@property (strong, nonatomic)  CLLocation *coreLocation;

@property (assign, nonatomic)  BOOL onlyNeedLocation;

@property (assign, nonatomic)  NSInteger locationTimes;

@property (strong, nonatomic)  NSArray *settingCitys;

@end

static ZYLocationManager *manager = nil;
@implementation ZYLocationManager

+ (ZYLocationManager *)singleTon
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}

+ (void)startUpdateLocationIsOnlyNeedLocations:(BOOL)onlyNeedLocations andCallBackBlock:(LocationBlock)locationBlock
{
    if ([self checkHasOpenLocationService]) {
        [self startLocation];
        [self singleTon].localBlock = locationBlock;
        [self singleTon].onlyNeedLocation = onlyNeedLocations;
        [self singleTon].locationTimes = 0;
    }
}

+ (void)startUpdateLocationTimes:(NSInteger)times andCallBack:(LocationBlock)locationBlock
{
    if ([self checkHasOpenLocationService]) {
        [self startLocation];
        [self singleTon].localBlock = locationBlock;
        [self singleTon].onlyNeedLocation = NO;
        [self singleTon].locationTimes = times;
    }
}

+ (void)startLocation
{
    CLLocationManager *locationManager = [[self singleTon] locationManager];
    [locationManager startUpdatingLocation];
}

- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        [_locationManager requestWhenInUseAuthorization];
        _locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    }
    return _locationManager;
}

- (CLGeocoder *)geoCoder
{
    if (!_geoCoder) {
        _geoCoder = [[CLGeocoder alloc]init];
    }
    return _geoCoder;
}

+ (BOOL)checkHasOpenLocationService
{
    __block BOOL openLocation;
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if ([CLLocationManager locationServicesEnabled]) {
        if (status == kCLAuthorizationStatusNotDetermined) {
            [self startLocation];
        } else if (status == kCLAuthorizationStatusDenied) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"定位被禁用" message:@"去设置允许访问你的位置信息" preferredStyle:(UIAlertControllerStyleAlert)];
            [alertController addAction:[UIAlertAction actionWithTitle:@"不去" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
                [alertController dismissViewControllerAnimated:YES completion:nil];
                openLocation = NO;
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"去开启" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *_Nonnull action) {
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    //去开启定位之后返回到应用再执行一次定位请求，如果用户开启了就能回传定位数据如果没有开启定位，则返回和之前一样为空了。
                    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startLocation) name:UIApplicationWillEnterForegroundNotification object:nil];
                    [[UIApplication sharedApplication] openURL:url];
                }
            }]];
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
        } else if (status == kCLAuthorizationStatusRestricted) {
            openLocation = NO;
        } else {
            openLocation = YES;
        }
    } else {
        openLocation = NO;
    }
    return YES;
}

//locationDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    if (self.onlyNeedLocation && self.localBlock) {
        [manager stopUpdatingLocation];
        self.localBlock([locations lastObject], nil, nil);
    } else {
        [self.geoCoder reverseGeocodeLocation:[locations lastObject] completionHandler:^(NSArray<CLPlacemark *> *_Nullable placemarks, NSError *_Nullable error) {
            if (!error) {
                CLPlacemark *placeMark = [placemarks lastObject];

                ZYLocationModel *locationModel = [ZYLocationModel new];

                if (placeMark.addressDictionary) {                             //兼容 IOS11 之前版本
                    locationModel.subCity = placeMark.addressDictionary[@"SubLocality"];  //县
                    locationModel.city = placeMark.addressDictionary[@"City"]; //市
                    locationModel.province = placeMark.addressDictionary[@"State"];       //省
                    locationModel.detailAddress = placeMark.addressDictionary[@"Street"]; //详细地址
                    locationModel.fullAddress = [placeMark.addressDictionary[@"FormattedAddressLines"] firstObject];
                } else {
                    locationModel.subCity = placeMark.subLocality;             //县
                    locationModel.city = placeMark.locality;                   //市
                    locationModel.province = placeMark.administrativeArea;     //省
                    locationModel.detailAddress = placeMark.thoroughfare;      //详细地址
                    locationModel.twoLevelInstitutions = placeMark.administrativeArea;
                    locationModel.threeLevelInstitutions = placeMark.locality;
                }
                                                                               //如果administrativeArea为空 则说明是直辖市 将市名作为省名
                if (!placeMark.administrativeArea) {
                    locationModel.province = placeMark.locality;
                    locationModel.twoLevelInstitutions = placeMark.locality;
                    locationModel.threeLevelInstitutions = placeMark.subLocality;
                }

                self.locationTimes = placeMark.locality == nil ? self.locationTimes - 1 : 0;

                self.locationTimes > 0 ? [[self class] startLocation] : [manager stopUpdatingLocation];

                if ([self checkIsSettingCity:locationModel.twoLevelInstitutions]) {
                    locationModel.twoLevelInstitutions = placeMark.locality;
                    locationModel.threeLevelInstitutions = placeMark.subLocality;
                }

                self.localBlock([locations lastObject], locationModel, nil);
            } else {
                [manager stopUpdatingLocation];
                self.localBlock([locations lastObject], nil, error);
            }
        }];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [manager stopUpdatingLocation];
    if (self.localBlock) {
        self.localBlock(nil, nil, error);
    }
}

- (BOOL)checkIsSettingCity:(NSString *)city
{
    if ([self.settingCitys containsObject:city]) {
        return YES;
    }
    return NO;
}

- (NSArray *)settingCitys
{
    if (!_settingCitys) {
        _settingCitys = @[@"青岛市", @"大连市", @"天津市", @"深圳市", @"北京市", @"厦门市", @"宁波市", @"重庆市", @"上海市"];
    }
    return _settingCitys;
}

@end

@implementation ZYLocationModel

- (NSString *)fullAddress
{
    if (self.province) {
        return [NSString stringWithFormat:@"%@%@%@%@", self.province, self.city, self.subCity, self.detailAddress];
    }
    return @"";
}

@end
