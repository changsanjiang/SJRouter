//
//  SJDemoRouteHandlers.m
//  SJRouter_Example
//
//  Created by BlueDancer on 2019/6/9.
//  Copyright © 2019 changsanjiang@gmail.com. All rights reserved.
//

#import "SJDemoRouteHandlers.h"
#import "SJRouteHandler.h"
#import "TestViewControllerPush.h"
#import "TestViewControllerPresent.h"

@implementation SJDemoRouteHandlers
+ (NSArray<NSString *> *)multiRoutePath {
    return @[@"test/vc/push", @"test/vc/present"];
}

+ (void)handleRequest:(SJRouteRequest *)request topViewController:(UIViewController *)topViewController completionHandler:(SJCompletionHandler)completionHandler {
    if ( [request.requestPath isEqualToString:@"test/vc/push"] ) {
        TestViewControllerPush *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"push"];
        [topViewController.navigationController pushViewController:vc animated:YES];
        if ( completionHandler ) completionHandler(nil, nil);
    }
    else if ( [request.requestPath isEqualToString:@"test/vc/present"] ) {
        TestViewControllerPresent *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"present"];
        [topViewController presentViewController:vc animated:YES completion:nil];
        if ( completionHandler ) completionHandler(nil, nil);
    }
}
@end
