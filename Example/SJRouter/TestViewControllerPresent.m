//
//  TestViewControllerPresent.m
//  SJRouter_Example
//
//  Created by 畅三江 on 2018/9/14.
//  Copyright © 2018 changsanjiang@gmail.com. All rights reserved.
//

#import "TestViewControllerPresent.h"

@interface TestViewControllerPresent ()
@property (nonatomic, copy, nullable) SJCompletionHandler completionHandler;
@end

@implementation TestViewControllerPresent

+ (NSString *)routePath {
    return @"test/vc/present";
}

+ (UIViewController *)instanceWithParameters:(nullable SJParameters)parameters completionHandler:(nullable SJCompletionHandler)completionHandler {
    TestViewControllerPresent *vc = [TestViewControllerPresent new];
    vc.completionHandler = completionHandler;
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
