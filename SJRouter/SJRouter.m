//
//  SJRouter.m
//  Pods
//
//  Created by 畅三江 on 2018/9/14.
//

#import "SJRouter.h"
#import <objc/message.h>

NS_ASSUME_NONNULL_BEGIN
static UIViewController *_sj_get_top_view_controller() {
    UIViewController *vc = UIApplication.sharedApplication.keyWindow.rootViewController;
    while (  [vc isKindOfClass:[UINavigationController class]] || [vc isKindOfClass:[UITabBarController class]] ) {
        if ( [vc isKindOfClass:[UINavigationController class]] ) vc = [(UINavigationController *)vc topViewController];
        if ( [vc isKindOfClass:[UITabBarController class]] ) vc = [(UITabBarController *)vc selectedViewController];
        if ( vc.presentedViewController ) vc = vc.presentedViewController;
    }
    return vc;
}

@interface SJRouter()
@property (nonatomic, strong, readonly) NSMutableDictionary<NSString *, Class<SJRouteHandler>> *handlersM;
@end

@implementation SJRouter
+ (instancetype)shared {
    static id _instace;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

- (instancetype)init {
    self = [super init];
    if ( !self ) return nil;
    _handlersM = [NSMutableDictionary new];
    int count = objc_getClassList(NULL, 0);
    Class *classes = (Class *)malloc(sizeof(Class) * count); objc_getClassList(classes, count);
    Protocol *p_handler = @protocol(SJRouteHandler);
    for ( int i = 0 ; i < count ; ++ i ) {
        Class cls = classes[i];
        for ( Class thisCls = cls ; nil != thisCls ; thisCls = class_getSuperclass(thisCls) ) {
            if ( !class_conformsToProtocol(thisCls, p_handler) ) continue;
            if ( ![(id)thisCls respondsToSelector:@selector(routePath)] ) continue;
            if ( ![(id)thisCls respondsToSelector:@selector(handleRequestWithParameters:topViewController:completionHandler:)] ) continue;
            _handlersM[[(id<SJRouteHandler>)thisCls routePath]] = thisCls;
            break;
        }
    }
    return self;
}

- (void)handleRequest:(SJRouteRequest *)request completionHandler:(SJCompletionHandler)completionHandler {
    NSParameterAssert(request); if ( !request ) return;
    Class<SJRouteHandler> handler = _handlersM[request.requestPath];
    if ( handler ) {
        [handler handleRequestWithParameters:request.requestPath topViewController:_sj_get_top_view_controller() completionHandler:completionHandler];
    }
    else {
        printf("\n (-_-) Unhandled request: %s", request.description.UTF8String);
    }
}
@end
NS_ASSUME_NONNULL_END
