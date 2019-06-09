//
//  TestViewControllerPush.m
//  SJRouter_Example
//
//  Created by 畅三江 on 2018/9/14.
//  Copyright © 2018 changsanjiang@gmail.com. All rights reserved.
//

#import "TestViewControllerPush.h"

NS_ASSUME_NONNULL_BEGIN
@interface TestViewControllerPush ()
@end

@implementation TestViewControllerPush

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    self.view.backgroundColor = UIColor.orangeColor;
    // Do any additional setup after loading the view.
}

@end
NS_ASSUME_NONNULL_END
