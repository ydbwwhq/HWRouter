//
//  HWRouter.m
//  HWRouter
//

ddddadd 

//还不错啊哈哈
//  Created by shinezone on 2018/8/2.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import "HWRouter.h"
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)
@implementation HWRouter
+ (void)addRoute:(NSString *)router handler:(MHandler)handler
{
    if(routers == nil)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            routers = [NSMutableArray array];
        });
    }
    for(NSDictionary *value in routers)
    {
        NSString *routerName = value.allKeys[0];
        if([router isEqualToString:routerName])
        {
            [routers removeObject:value];
            break;
        }
    }
    [routers addObject:@{router:handler}];
    
}
+ (void)route:(NSString *)router param:(NSDictionary *)param
{
    MHandler handler = nil;
    if(routers == nil)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            routers = [NSMutableArray array];
        });
    }
    for(NSDictionary *value in routers)
    {
        NSString *routerName = value.allKeys[0];
        if([router isEqualToString:routerName])
        {
            handler = value[routerName];
            break;
        }
    }
    if(handler != nil)
    {
        handler(param);
    }
}
+ (void)route:(NSString *)router
{
    [HWRouter route:router param:nil];
}
//+ (void)registerRouter:(NSString *)routerName serviceName:(NSString*)serviceName
//{
//    [HWRouter writeRouterToConfig:routerName methodName:serviceName];
//}
//+ (void)performRouter:(NSString *)routerName param:(NSDictionary *)param
//{
//    NSString *methodName = [HWRouter readRouterFromConfig:routerName];
//    SEL selctor = NSSelectorFromString(methodName);
//    NSArray *routerArr = [routerName componentsSeparatedByString:@"/"];
//    NSString *className = routerArr[1];
//    if(className != nil)
//    {
//        Class cls = NSClassFromString(className);
//
//        SuppressPerformSelectorLeakWarning([cls performSelector:selctor withObject:param]);
//    }
//}
//+ (UIViewController *)getVC:(NSString *)routerName param:(NSDictionary *)param
//{
//    NSString *serviceName = [HWRouter readRouterFromConfig:routerName];
//    UIViewController *vc = nil;
//    if(serviceName != nil)
//    {
//        Class cls = NSClassFromString(serviceName);
//        if(cls != nil)
//        {
//            vc = [[cls alloc] init];
//            if(param != nil)
//            {
//                NSDictionary *params = @{@"param":param};
//                SEL sel = @selector(setParams:);
//                if([vc respondsToSelector:sel])
//                {
//                    SuppressPerformSelectorLeakWarning([vc performSelector:sel withObject:params]);
//
//                }
//            }
//        }
//    }
//    return  vc;
//}
//
//+ (void)writeRouterToConfig:(NSString *)routerName methodName:(NSString*)methodName
//{
//    //获取本地沙盒路径
//    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    //获取完整路径
//    NSString *docPath = [path objectAtIndex:0];
//    // 3.新建数据
//    NSDictionary *item = @{routerName:methodName};
//    NSString *filepath = [docPath stringByAppendingPathComponent:@"config.plist"];
//    if(![[NSFileManager defaultManager] fileExistsAtPath:filepath])
//    {
//        [[NSFileManager defaultManager] createFileAtPath:filepath contents:nil attributes:nil];
//    }
//    NSMutableArray *data = [NSMutableArray arrayWithContentsOfFile:filepath];
//    if (data == nil) {
//        data = [NSMutableArray new];
//        [data addObject:item];
//    }else
//    {
//        for(NSDictionary *value in data)
//        {
//            NSString *router = value.allKeys[0];
//            if([router isEqualToString:routerName])
//            {
//                [data removeObject:value];
//                break;
//            }
//        }
//    }
//    [data addObject:item];
//    [data writeToFile:filepath atomically:YES];
//}
//+ (NSString*)readRouterFromConfig:(NSString*)routerName
//{
//    //获取本地沙盒路径
//    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    //获取完整路径
//    NSString *docPath = [path objectAtIndex:0];
//
//    NSString *filepath = [docPath stringByAppendingPathComponent:@"config.plist"];
//    NSMutableArray *data = [NSMutableArray arrayWithContentsOfFile:filepath];
//    for(NSDictionary *value in data)
//    {
//        NSString *router = value.allKeys[0];
//        if([router isEqualToString:routerName])
//        {
//            return value[router];
//        }
//    }
//    return @"";
//}


@end
