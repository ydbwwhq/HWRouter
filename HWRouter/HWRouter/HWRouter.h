//
//  HWRouter.h
//  HWRouter
//
//  Created by shinezone on 2018/8/2.
//  Copyright © 2018年 shinezone. All rights reserved.
//


#import <UIKit/UIKit.h>
typedef bool (^MHandler)(NSDictionary* params);
static NSMutableArray *routers;
@interface HWRouter : NSObject
+ (void)addRoute:(NSString*)router handler:(MHandler)handler;
+ (void)route:(NSString *)router param:(NSDictionary*)param;
@end
