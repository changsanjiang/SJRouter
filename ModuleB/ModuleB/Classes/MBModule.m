//
//  MBModule.m
//  ModuleB
//
//  Created by BlueDancer on 2019/6/9.
//

#import "MBModule.h"
#import <SJRouter/SJRouteHandler.h>
#import "MBViewController.h"
#import "MB2ViewController.h"

@interface MBModule()<SJRouteHandler>

@end

@implementation MBModule
+ (NSArray<NSString *> *)multiRoutePath {
    return @[@"MBModule/B1",
             @"MBModule/B2"];
}

+ (void)handleRequest:(SJRouteRequest *)request topViewController:(UIViewController *)topViewController completionHandler:(SJCompletionHandler)completionHandler {
    if ( [request.requestPath isEqualToString:@"MBModule/B1"] ) {
        MBViewController *vc = [[MBViewController alloc] init];
        [topViewController.navigationController pushViewController:vc animated:YES];
    }
    else if ( [request.requestPath isEqualToString:@"MBModule/B2"] ) {
        MB2ViewController *vc = [[MB2ViewController alloc] init];
        [topViewController.navigationController pushViewController:vc animated:YES];
    }
}

@end
