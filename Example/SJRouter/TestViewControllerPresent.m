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
@property (nonatomic, copy, nullable) SJCompletionHandler completionHandler;
@end

@implementation TestViewControllerPresent

+ (NSString *)routePath {
    return @"test/vc/present";
}

+ (void)handleRequestWithParameters:(nullable SJParameters)parameters topViewController:(UIViewController *)topViewController completionHandler:(nullable SJCompletionHandler)completionHandler {
    TestViewControllerPresent *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"present"];
    vc.completionHandler = completionHandler;
    [topViewController presentViewController:vc animated:YES completion:nil];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if ( self.completionHandler ) self.completionHandler(nil, nil);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    // Do any additional setup after loading the view.
}
@end
NS_ASSUME_NONNULL_END
