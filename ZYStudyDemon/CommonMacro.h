//
//  CommonMacro.h
//  ZYStudyDemon
//
//  Created by yong on 2020/2/18.
//  Copyright © 2020 yong zhang. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h

#define UIScreenWidth                              [UIScreen mainScreen].bounds.size.width
#define UIScreenHeight                             [UIScreen mainScreen].bounds.size.height
#define UISreenWidthScale   UIScreenWidth / 320

#define isIphoneX ({\
BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
if (!UIEdgeInsetsEqualToEdgeInsets([UIApplication sharedApplication].delegate.window.safeAreaInsets, UIEdgeInsetsZero)) {\
isPhoneX = YES;\
}\
}\
isPhoneX;\
})
//颜色
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16 )) / 255.0 green:((( s & 0xFF00 ) >> 8 )) / 255.0 blue:(( s & 0xFF )) / 255.0 alpha:1.0]
#define UIColorRGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGB(rgbValue) UIColorFromRGBA(rgbValue, 1.0)

#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

#define UIColorFromRGB(rgbValue) UIColorFromRGBA(rgbValue, 1.0)

#define dispatch_sync_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define dispatch_async_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}


#endif /* CommonMacro_h */
