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
@property (nonatomic, copy, nullable) SJCompletionHandler completionHandler;
@end

@implementation TestViewControllerPush

+ (NSString *)routePath {
    return @"test/vc/push";
}

+ (UIViewController *)instanceWithParameters:(nullable SJParameters)parameters completionHandler:(nullable SJCompletionHandler)completionHandler {
    TestViewControllerPush *vc = [TestViewControllerPush new];
    vc.completionHandler = completionHandler;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    self.view.backgroundColor = UIColor.orangeColor;
    // Do any additional setup after loading the view.
}

@end
NS_ASSUME_NONNULL_END
