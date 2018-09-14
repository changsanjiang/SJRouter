//
//  SJRouter.h
//  Pods
//
//  Created by 畅三江 on 2018/9/14.
//
//  https://github.com/changsanjiang/SJRouter
//
//  QQ群: 719616775
//
//  Email: changsanjiang@gmail.com
//

#import <Foundation/Foundation.h>
#import "SJRouteRequest.h"

NS_ASSUME_NONNULL_BEGIN
@interface SJRouter : NSObject
+ (instancetype)shared;
- (void)handleRequest:(SJRouteRequest *)request completionHandler:(SJCompletionHandler)completionHandler;
@end
NS_ASSUME_NONNULL_END
