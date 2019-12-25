//
//  SJAppDelegate.m
//  SJRouter
//
//  Created by changsanjiang@gmail.com on 09/14/2018.
//  Copyright (c) 2018 changsanjiang@gmail.com. All rights reserved.
//

#import "SJAppDelegate.h"
#import <SJRouter/SJRouter.h>

@implementation SJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    SJRouteRequest *_Nullable request = [[SJRouteRequest alloc] initWithURL:url];
    if ( [SJRouter.shared canHandleRoutePath:request.requestPath] ) {
        [SJRouter.shared handleRequest:request completionHandler:nil];
    }
    
    return YES;
}
@end
