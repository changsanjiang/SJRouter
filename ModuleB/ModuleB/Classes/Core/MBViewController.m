//
//  MBViewController.m
//  ModuleB
//
//  Created by BlueDancer on 2019/6/9.
//

#import "MBViewController.h"
#import <SJRouter/SJRouter.h>

@interface MBViewController ()
@property (nonatomic, strong) UIButton *buttonA1;
@property (nonatomic, strong) UIButton *buttonA2;
@end

@implementation MBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MBModule B1 ViewController";
    
    self.view.backgroundColor =  [UIColor colorWithRed:arc4random() % 256 / 255.0
                                                 green:arc4random() % 256 / 255.0
                                                  blue:arc4random() % 256 / 255.0
                                                 alpha:1];
    
    _buttonA1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 35)];
    [_buttonA1 setTitle:@"Push MAModule A1" forState:UIControlStateNormal];
    [_buttonA1 addTarget:self action:@selector(_push1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonA1];
    
    
    _buttonA2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 220, 200, 35)];
    [_buttonA2 setTitle:@"Push MAModule A2" forState:UIControlStateNormal];
    [_buttonA2 addTarget:self action:@selector(_push2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonA2];
}

- (void)_push1 {
    SJRouteRequest *request = [[SJRouteRequest alloc] initWithPath:@"MAModule/A1" parameters:nil];
    [SJRouter.shared handleRequest:request completionHandler:nil];
}

- (void)_push2 {
    SJRouteRequest *request = [[SJRouteRequest alloc] initWithPath:@"MAModule/A2" parameters:nil];
    [SJRouter.shared handleRequest:request completionHandler:nil];
}

@end
