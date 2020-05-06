//
//  ZYTestViewController.h
//  ZYStudyDemon
//
//  Created by yong on 2019/2/13.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import "ZYBaseViewController.h"


//objc_boxable
typedef struct __attribute__((objc_boxable)) {
    CGFloat x, y, width, height;
} ZYRect;


NS_ASSUME_NONNULL_BEGIN
//__attribute__((objc_subclassing_restricted)) //强制为finalclass 不可以被继承 ,打开下面的继承自本类的n头文件编译器报错
//__attribute__((objc_subclassing_restricted))


//objc_runtime_name 用于 @interface 或 @protocol，将类或协议的名字在编译时指定成另一个：

/*
__attribute__((objc_runtime_name("SarkGay")))
@interface Sark : NSObject
@end

NSLog(@"%@", NSStringFromClass([Sark class])); // "SarkGay"
*/


@interface ZYBlackMagicController : ZYBaseViewController

@end

//测试__attribute__((objc_subclassing_restricted))
@interface ZYTestController : ZYBlackMagicController

@end


NS_ASSUME_NONNULL_END
