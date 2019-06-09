//
//  TestViewControllerPresent.m
//  SJRouter_Example
//
//  Created by 畅三江 on 2018/9/14.
//  Copyright © 2018 changsanjiang@gmail.com. All rights reserved.
//

#import "TestViewControllerPresent.h"

NS_ASSUME_NONNULL_BEGIN
@interface TestViewControllerPresent ()
@end

@implementation TestViewControllerPresent
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    // Do any additional setup after loading the view.
}
@end
NS_ASSUME_NONNULL_END
