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
    request.displayType = SJViewControllerDisplayTypePush;
    [SJRouter.shared handleRequest:request];
}

- (IBAction)present:(id)sender {
    SJRouteRequest *request = [[SJRouteRequest alloc] initWithPath:@"test/vc/present" parameters:@{@"dfsd":@(23432)}];
    request.displayType = SJViewControllerDisplayTypePresent;
    [SJRouter.shared handleRequest:request];
}

@end
