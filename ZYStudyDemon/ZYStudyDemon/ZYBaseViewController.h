//
//  BaseViewController.h
//  ZYStudyDemon
//
//  Created by yong on 2018/12/28.
//  Copyright © 2018 yong zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "AFNetworking.h"
#import "SDImageCache.h"

NS_ASSUME_NONNULL_BEGIN
//__attribute__((objc_requires_super)) //标志子类继承这个方法的时候需要调用super的这个方法。否则编译器警告
@interface ZYBaseViewController : UIViewController
//-(void)loadBaseUI __attribute__((objc_requires_super));
@end

NS_ASSUME_NONNULL_END
