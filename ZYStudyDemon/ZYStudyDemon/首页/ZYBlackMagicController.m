//
//  ZYTestViewController.m
//  ZYStudyDemon
//
//  Created by yong on 2019/2/13.
//  Copyright © 2019 yong zhang. All rights reserved.
//

#import "ZYBlackMagicController.h"
#import <objc/runtime.h>

#import "YGActivityModel.h"
@interface ZYBlackMagicController ()

@property (strong, nonatomic) IBOutlet UIView *testView;

@property (weak, nonatomic) IBOutlet UIView *viewOne;
@property (strong, nonatomic) IBOutlet UIView *testViewTwo;
@property (strong, nonatomic)  YGActivityModel *testModel;
@property (weak, nonatomic) IBOutlet UIButton *testButt;

@end

@implementation ZYBlackMagicController

//enable_if 用在 C 函数上，可以用来实现参数的静态检查：
static void printValidAge(int age)
__attribute__((enable_if(age > 0 && age < 120, "你丫火星人？")))
{
    printf("%d", age);
}

+ (void)load
{
    NSLog(@"loadFunction");
}

//__attribute__((cleanup(...)))，用于修饰一个变量，在它的作用域结束时可以自动执行一个指定的方法
// 指定一个cleanup方法，注意入参是所修饰变量的地址，类型要一样
// 对于指向objc对象的指针(id *)，如果不强制声明__strong默认是__autoreleasing，造成类型不匹配
static void stringCleanUp(__strong NSString **string)
{
    NSLog(@"%@", *string);
}

// 在某个方法中：
/*
{
    __strong NSString *string __attribute__((cleanup(stringCleanUp))) = @"sunnyxx";
} // 当运行到这个作用域结束时，自动调用stringCleanUp
*/
//作用域结束，包括大括号结束、return、goto、break、exception等各种情况
// 自定义的Class
/*
static void sarkCleanUp(__strong Sark **sark) {
    NSLog(@"%@", *sark);
}
__strong Sark *sark __attribute__((cleanup(sarkCleanUp))) = [Sark new];
// 基本类型
static void intCleanUp(NSInteger *integer) {
    NSLog(@"%d", *integer);
}
NSInteger integer __attribute__((cleanup(intCleanUp))) = 1;
*/
//一个作用域内有若干个cleanup的变量，他们的调用顺序是先入后出的栈式顺序；而且，cleanup是先于这个对象的dealloc调用的

- (void)viewDidLoad
{
    [super viewDidLoad];

    //测试objc_boxable
    ZYRect rect = { 10, 50, 200, 200 };
    NSValue *rectValue = @(rect);
    NSLog(@"objc_boxable测试===%@", rectValue);

    Class metaClass_child = objc_getMetaClass("ZYWdMessageCountModel");
    Class superClass_metaClass_child = class_getSuperclass(metaClass_child);
    Class metaClass_parent = objc_getMetaClass("YGActivityModel");

    Class superClass_metaClass_parent = class_getSuperclass(metaClass_parent);
    Class metaClass_NSObject = objc_getMetaClass("NSObject");
    Class superClass_metaClass_NSObject = class_getSuperclass(metaClass_NSObject);
    Class superClass_NSObject = class_getSuperclass(superClass_metaClass_NSObject);

    self.testModel = [YGActivityModel new];
    self.testModel.flag = 1234;
    self.testModel.tag = YES;

    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(100, 200, 200, 200);
    butt.backgroundColor = [UIColor redColor];
    [butt addTarget:self action:@selector(tapCountJianJian) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butt];

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
//    imageView.userInteractionEnabled = YES;
    [self.testButt addSubview:imageView];

    /*
    unsigned int count, outCount;;
    objc_property_t *propertyArra = class_copyPropertyList([self.testModel class], &count);
    for (unsigned int i=0; i<count; i++) {
        objc_property_t property = propertyArra[0];
        NSLog(@"propertyName===%@",[[NSString alloc]initWithCString:property_getName(property) encoding:NSUTF8StringEncoding]);
        NSLog(@"================%@",[[NSString alloc]initWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding]);

        objc_property_attribute_t *attributs = property_copyAttributeList(property, &outCount);
        for (unsigned int j = 0; j<outCount;j++) {
            NSLog(@"attributs:%s===%s",attributs[j].name,attributs[j].value);
        }
    }

    Method *methods = class_copyMethodList([YGActivityModel class], &outCount);

    for (unsigned int j = 0; j<outCount;j++) {
        NSLog(@"methodName:%s",sel_getName(method_getName(methods[j])));
       struct  objc_method_description *discriptions = method_getDescription(methods[j]);
        NSLog(@"attributs:===%s",discriptions[0].types);
    }
    */
}

- (void)tapCountJianJian
{
    self.testModel.flag--;
    NSLog(@"testModel.flag====%ld", (long)self.testModel.flag);
}

- (void)loadBaseUI //父类方法用__attribute__((objc_requires_super))标记，所以子类调用的时候必须用super
{
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (IBAction)test:(UIButton *)sender
{
    NSLog(@"dlfjsalfdjsalfdjla");
}

@end
