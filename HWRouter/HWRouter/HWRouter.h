//
//  HWRouter.h
//  HWRouter
//
//  Created by shinezone on 2018/8/2.
//  Copyright © 2018年 shinezone. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface HWRouter : NSObject
+ (void)registerRouter:(NSString*)routerName serviceName:(NSString*)serviceName;
+ (void)performRouter:(NSString*)routerName param:(NSString*)param;
+ (UIViewController*)getVC:(NSString*)routerName param:(NSDictionary*)param;
@end
