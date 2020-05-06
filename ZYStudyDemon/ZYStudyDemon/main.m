//
//  main.m
//  ZYStudyDemon
//
//  Created by yong zhang on 2018/6/28.
//  Copyright © 2018年 yong zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


//constructor / destructor 构造器和析构器 在主函数main启动之前（程序启动前），main函数return之后(程序退出之后执行)
//若需要控制构造器方法的优先级可用用__attribute__((constructor(101)))，里面的数字越小优先级越高，1 ~ 100 为系统保留
/*
1.所有 Class 都已经加载完成
2.main 函数还未执行
3.无需像 +load 还得挂载在一个 Class 中
*/
//constructor 比load方法调用晚一点点。

__attribute__((constructor))
static void beforeMain(void) {
    NSLog(@"beforeMain");
}
__attribute__((destructor))
static void afterMain(void) {
    NSLog(@"afterMain");
}


//__attribute__((overloadable)) 用于 C 函数，可以定义若干个函数名相同，但参数不同的方法，调用时编译器会自动根据参数选择函数
__attribute__((overloadable)) void logAnything(id obj) {
    NSLog(@"%@", obj);
}
__attribute__((overloadable)) void logAnything(int number) {
    NSLog(@"%@", @(number));
}
__attribute__((overloadable)) void logAnything(CGRect rect) {
    NSLog(@"%@", NSStringFromCGRect(rect));
}







int main(int argc, char * argv[]) {
	@autoreleasepool {
        // Tests
        logAnything(@[@"1", @"2"]);
        logAnything(233);
        logAnything(CGRectMake(1, 2, 3, 4));
        
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}
