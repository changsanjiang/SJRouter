//
//  SJViewController.m
//  SJRouter
//
//  Created by changsanjiang@gmail.com on 09/14/2018.
//  Copyright (c) 2018 changsanjiang@gmail.com. All rights reserved.
//

#import "SJViewController.h"
#import "WebTestViewController.h"
#import <SJRouter/SJRouter.h>

@interface SJViewController ()

@end

@implementation SJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _configRouter];
}

- (IBAction)ma:(id)sender {
    SJRouteRequest *request = [[SJRouteRequest alloc] initWithPath:@"MAModule/A1" parameters:@{@"测试请求参数":@"123"}];
    [SJRouter.shared handleRequest:request completionHandler:nil];
}

- (IBAction)mb:(id)sender {
    SJRouteRequest *request = [[SJRouteRequest alloc] initWithPath:@"MBModule/B1" parameters:@{@"测试请求参数":@"123"}];
    [SJRouter.shared handleRequest:request completionHandler:nil];
}

- (IBAction)un:(id)sender {
    SJRouteRequest *request = [[SJRouteRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.baidu.com/test/01.ts?id=123"]];
    [SJRouter.shared handleRequest:request completionHandler:nil];
}

#pragma mark -

- (void)_configRouter {
    /// router无法处理某个请求时的回调
    SJRouter.shared.unhandledCallback = ^(SJRouteRequest * _Nonnull request, UIViewController * _Nonnull topViewController) {
#ifdef DEBUG
        NSLog(@"%d - %s", (int)__LINE__, __func__);
#endif
        /// 尝试用网页打开
        if ( request.originalURL ) {
            WebTestViewController *vc = [[WebTestViewController alloc] initWithURL:request.originalURL];
            [topViewController.navigationController pushViewController:vc animated:YES];
            printf("\n尝试通过网页打开, Router未能处理这个请求: %s.", request.description.UTF8String);
        }
        else {
            NSLog(@"无法处理的请求: %@", request);
        }
    };
}
@end
