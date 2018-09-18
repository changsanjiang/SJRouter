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
    unsigned int classNamesCount = 0;
    //用 executablePath 获取当前 app image
    NSString *appImage = [NSBundle mainBundle].executablePath;
    //objc_copyClassNamesForImage 获取到的是 image 下的类，直接排除了系统的类
    const char **classes = objc_copyClassNamesForImage([appImage UTF8String], &classNamesCount);
    NSMutableArray *classNameStrings = [NSMutableArray array];
    for (unsigned int i = 0; i < classNamesCount; i++) {
        const char *className = classes[i];
        NSString *classNameString = [NSString stringWithUTF8String:className];
        [classNameStrings addObject:classNameString];
    }
    NSArray *allClassNames = [classNameStrings sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    for ( int i = 0; i < allClassNames.count; i++) {
        Class cls = NSClassFromString(allClassNames[i]);
        if ( !class_conformsToProtocol(cls, p_handler) ) continue;
        if ( ![(id)cls respondsToSelector:@selector(routePath)] ) continue;
        if ( ![(id)cls respondsToSelector:@selector(handleRequestWithParameters:topViewController:completionHandler:)] ) continue;
        _handlersM[[(id<SJRouteHandler>)cls routePath]] = cls;
    }
    if ( classes ) free(classes);
    return self;
}

- (void)handleRequest:(SJRouteRequest *)request completionHandler:(nullable SJCompletionHandler)completionHandler {
    NSParameterAssert(request); if ( !request ) return;
    Class<SJRouteHandler> handler = _handlersM[request.requestPath];
    if ( handler ) {
        [handler handleRequestWithParameters:request.prts topViewController:_sj_get_top_view_controller() completionHandler:completionHandler];
    }
    else {
        printf("\n (-_-) Unhandled request: %s", request.description.UTF8String);
    }
}
@end
NS_ASSUME_NONNULL_END
