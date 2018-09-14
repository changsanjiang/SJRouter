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

@interface _SJRouteHandlerClassInfo: NSObject
- (instancetype)initWithClass:(Class<SJRouteHandler>)class;
@property (nonatomic, strong, readonly) Class thisClass;
@property (nonatomic, strong, readonly, nullable) NSString *routePath;
@end

@implementation _SJRouteHandlerClassInfo
- (instancetype)initWithClass:(Class<SJRouteHandler>)class {
    self = [super init];
    if ( !self ) return nil;
    _thisClass = class;
    return self;
}
- (nullable NSString *)routePath {
    if ( [(id)_thisClass respondsToSelector:@selector(routePath)] ) return [_thisClass routePath];
    return nil;
}
- (nullable id)createInstance:(nullable SJParameters)parameters completionHandler:(nullable SJCompletionHandler)completionHandler {
    if ( [(id)_thisClass respondsToSelector:@selector(instanceWithParameters:completionHandler:)] ) return [_thisClass instanceWithParameters:parameters completionHandler:completionHandler];
    return nil;
}
@end

@interface SJRouter()
@property (nonatomic, strong, readonly) NSMutableArray<_SJRouteHandlerClassInfo *> *infosM;
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
    _infosM = [NSMutableArray new];
    int count = objc_getClassList(NULL, 0);
    Class *classes = (Class *)malloc(sizeof(Class) * count); objc_getClassList(classes, count);
    Protocol *p_handler = @protocol(SJRouteHandler);
    for ( int i = 0 ; i < count ; ++ i ) {
        Class cls = classes[i];
        for ( Class thisCls = cls ; nil != thisCls ; thisCls = class_getSuperclass(thisCls) ) {
            if ( !class_conformsToProtocol(thisCls, p_handler) ) continue;
            [_infosM addObject:[[_SJRouteHandlerClassInfo alloc] initWithClass:thisCls]];
            break;
        }
    }
    return self;
}

- (void)handleRequest:(SJRouteRequest *)request {
    NSParameterAssert(request); if ( !request ) return;
    for ( _SJRouteHandlerClassInfo *info in _infosM ) {
        if ( ![info.routePath isEqualToString:request.requestPath] ) continue;
        UIViewController *instance = [info createInstance:request.prts completionHandler:request.completionHandler];
        NSParameterAssert(instance); if ( !instance ) break;
        switch ( request.displayType ) {
            case SJViewControllerDisplayTypePush: {
                [_sj_get_top_view_controller().navigationController pushViewController:instance animated:YES];
            }
                break;
            case SJViewControllerDisplayTypePresent: {
                [_sj_get_top_view_controller() presentViewController:instance animated:YES completion:nil];
            }
                break;
        }
        return;
    }
    
    printf("\n (-_-) Unhandled request: %s", request.description.UTF8String);
}
@end
NS_ASSUME_NONNULL_END
