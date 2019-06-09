//
//  MAModule.m
//  ModuleA
//
//  Created by BlueDancer on 2019/6/9.
//

#import "MAModule.h"
#import <SJRouter/SJRouteHandler.h>
#import "MAViewController.h"
#import "MA2ViewController.h"

@interface MAModule()<SJRouteHandler>

@end

@implementation MAModule
+ (NSArray<NSString *> *)multiRoutePath {
    return @[@"MAModule/A1",
             @"MAModule/A2"];
}

+ (void)handleRequest:(SJRouteRequest *)request topViewController:(UIViewController *)topViewController completionHandler:(SJCompletionHandler)completionHandler {
    if ( [request.requestPath isEqualToString:@"MAModule/A1"] ) {
        MAViewController *vc = [[MAViewController alloc] init];
        [topViewController.navigationController pushViewController:vc animated:YES];
    }
    else if ( [request.requestPath isEqualToString:@"MAModule/A2"] ) {
        MA2ViewController *vc = [[MA2ViewController alloc] init];
        [topViewController.navigationController pushViewController:vc animated:YES];
    }
}

@end
