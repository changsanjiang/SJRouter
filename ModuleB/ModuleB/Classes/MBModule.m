//
//  MBModule.m
//  ModuleB
//
//  Created by BlueDancer on 2019/6/9.
//

#import "MBModule.h"
#import <SJRouter/SJRouteHandler.h>
#import <SJRouter/SJRouter.h>
#import "MBViewController.h"
#import "MB2ViewController.h"

///
/// 添加路由
///     第一步 遵守协议: <SJRouteHandler>
///     第二步 实现协议方法:`addRoutesToRouter:`, SJRouter 将在初始化期间调用它
///
@interface MBModule()<SJRouteHandler>

@end

@implementation MBModule
+ (void)addRoutesToRouter:(SJRouter *)router {
    [router addRoute:[SJRouteObject.alloc initWithPath:@"MBModule/B1" transitionMode:SJViewControllerTransitionModeNavigation createInstanceBlock:^(SJRouteRequest * _Nonnull request, SJCompletionHandler  _Nullable completionHandler) {
#ifdef DEBUG
        NSLog(@"%@", request.prts); // 打印请求的参数
#endif
        MBViewController *vc = [[MBViewController alloc] init];
        if ( completionHandler != nil ) completionHandler(vc, nil);
    }]];
    
    
    [router addRoute:[SJRouteObject.alloc initWithPath:@"MBModule/B2" transitionMode:SJViewControllerTransitionModeNavigation createInstanceBlock:^(SJRouteRequest * _Nonnull request, SJCompletionHandler  _Nullable completionHandler) {
        MB2ViewController *vc = [[MB2ViewController alloc] init];
        if ( completionHandler != nil ) completionHandler(vc, nil);
    }]];
}
@end
