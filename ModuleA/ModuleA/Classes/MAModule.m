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


///
/// 此模块为老版添加的方式, 新方式请查看 ModuleB
///
/// 此模块为老版添加的方式, 新方式请查看 ModuleB
///
/// 此模块为老版添加的方式, 新方式请查看 ModuleB
///
@interface MAModule()<SJRouteHandler>

@end

@implementation MAModule
/// 此模块为老版添加的方式, 新方式请查看 ModuleB
+ (NSArray<NSString *> *)multiRoutePath {
    return @[@"MAModule/A1",
             @"MAModule/A2"];
}

/// 此模块为老版添加的方式, 新方式请查看 ModuleB
+ (void)instanceWithRequest:(SJRouteRequest *)request completionHandler:(SJCompletionHandler)completionHandler {
    if ( [request.requestPath isEqualToString:@"MAModule/A1"] ) {
        MAViewController *vc = [[MAViewController alloc] init];
        if ( completionHandler ) completionHandler(vc, nil);
    }
    else if ( [request.requestPath isEqualToString:@"MAModule/A2"] ) {
        MA2ViewController *vc = [[MA2ViewController alloc] init];
        if ( completionHandler ) completionHandler(vc, nil);
    }
}

/// 此模块为老版添加的方式, 新方式请查看 ModuleB
+ (void)handleRequest:(SJRouteRequest *)request topViewController:(UIViewController *)topViewController completionHandler:(SJCompletionHandler)completionHandler {
    [self instanceWithRequest:request completionHandler:^(id  _Nullable result, NSError * _Nullable error) {
        if ( error != nil ) {
            // handle ....
            return ;
        }
        
        [topViewController.navigationController pushViewController:result animated:YES];
    }];
}
@end
