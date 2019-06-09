//
//  MAViewController.m
//  ModuleA
//
//  Created by BlueDancer on 2019/6/9.
//

#import "MAViewController.h"
#import <SJRouter/SJRouter.h>

@interface MAViewController ()
@property (nonatomic, strong) UIButton *buttonB1;
@property (nonatomic, strong) UIButton *buttonB2;
@end

@implementation MAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MAModule A1 ViewController";
    
    self.view.backgroundColor =  [UIColor colorWithRed:arc4random() % 256 / 255.0
                                                 green:arc4random() % 256 / 255.0
                                                  blue:arc4random() % 256 / 255.0
                                                 alpha:1];
    
    _buttonB1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 35)];
    [_buttonB1 setTitle:@"Push MBModule B1" forState:UIControlStateNormal];
    [_buttonB1 addTarget:self action:@selector(_push1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonB1];
    
    
    _buttonB2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 220, 200, 35)];
    [_buttonB2 setTitle:@"Push MBModule B2" forState:UIControlStateNormal];
    [_buttonB2 addTarget:self action:@selector(_push2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonB2];
}

- (void)_push1 {
    SJRouteRequest *request = [[SJRouteRequest alloc] initWithPath:@"MBModule/B1" parameters:nil];
    [SJRouter.shared handleRequest:request completionHandler:nil];
}

- (void)_push2 {
    SJRouteRequest *request = [[SJRouteRequest alloc] initWithPath:@"MBModule/B2" parameters:nil];
    [SJRouter.shared handleRequest:request completionHandler:nil];
}

@end
