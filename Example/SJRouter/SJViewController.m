//
//  SJViewController.m
//  SJRouter
//
//  Created by changsanjiang@gmail.com on 09/14/2018.
//  Copyright (c) 2018 changsanjiang@gmail.com. All rights reserved.
//

#import "SJViewController.h"
@import SJRouter;

@interface SJViewController ()

@end

@implementation SJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)push:(id)sender {
    SJRouteRequest *request = [[SJRouteRequest alloc] initWithPath:@"test/vc/push" parameters:@{@"dfsd":@(23432)}];
    [SJRouter.shared handleRequest:request completionHandler:^(id  _Nullable result, NSError * _Nullable error) {
#ifdef DEBUG
        NSLog(@"%d - %s", (int)__LINE__, __func__);
#endif
    }];
}

- (IBAction)present:(id)sender {
    SJRouteRequest *request = [[SJRouteRequest alloc] initWithPath:@"test/vc/present" parameters:@{@"dfsd":@(23432)}];
    [SJRouter.shared handleRequest:request completionHandler:^(id  _Nullable result, NSError * _Nullable error) {
#ifdef DEBUG
        NSLog(@"%d - %s", (int)__LINE__, __func__);
#endif
    }];
}

@end
