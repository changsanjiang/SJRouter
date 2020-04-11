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
        NSLog(@"%d - -[%@ %s], 请求参数: %@", (int)__LINE__, NSStringFromClass([self class]), sel_getName(_cmd), request.prts);
#endif
        MBViewController *vc = [[MBViewController alloc] init];
        if ( completionHandler != nil ) completionHandler(vc, nil);
    }]];
    
    
    [router addRoute:[SJRouteObject.alloc initWithPath:@"MBModule/B2" transitionMode:SJViewControllerTransitionModeNavigation createInstanceBlock:^(SJRouteRequest * _Nonnull request, SJCompletionHandler  _Nullable completionHandler) {
        MB2ViewController *vc = [[MB2ViewController alloc] init];
        if ( completionHandler != nil ) completionHandler(vc, nil);
    }]];
    
    /// 添加拦截器
    ///
    ///     拦截向"video/list"的请求. 决定是否可以处理路由
    ///
    ///     什么场景下适合添加拦截器?
    ///         比如跳转B界面需要用户登录, 否则需要跳转至登录界面. 因此从任何地方跳转B界面, 都需要能够及时拦截到, 增加对用户登录态的判断来决定是否允许跳转B界面
    ///
    [router addInterceptor:[SJRouteInterceptor interceptorWithPath:@"MBModule/B2" handler:^(SJRouteRequest * _Nonnull request, SJRouterInterceptionPolicyDecisionHandler  _Nonnull decisionHandler) {
//        // 对登录态的判断
//        if ( !User.isLogin ) {
//            decisionHandler(SJRouterInterceptionPolicyCancel);
//            // 跳转登录页面
//            SJRouteRequest *newRequest = [SJRouteRequest.alloc initWithPath:@"user/login" parameters:nil];
//            [SJRouter.shared handleRequest:newRequest completionHandler:nil];
//            return;
//        }
        
        // 也可以添加一些自己需要的参数
//        [request setValue:@"sjsjsjs" forParameterKey:@"keykeykey"];
        
        // - 否则返回允许执行路由
        decisionHandler(SJRouterInterceptionPolicyAllow);
    }]];
}

@end

