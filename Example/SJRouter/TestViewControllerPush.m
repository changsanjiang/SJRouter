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

+ (void)handleRequestWithParameters:(nullable SJParameters)parameters topViewController:(UIViewController *)topViewController completionHandler:(nullable  SJCompletionHandler)completionHandler {
    TestViewControllerPush *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"push"];
    vc.completionHandler = completionHandler;
    [topViewController.navigationController pushViewController:vc animated:YES];
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    if ( self.completionHandler ) self.completionHandler(nil, nil);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    self.view.backgroundColor = UIColor.orangeColor;
    // Do any additional setup after loading the view.
}

@end
NS_ASSUME_NONNULL_END
