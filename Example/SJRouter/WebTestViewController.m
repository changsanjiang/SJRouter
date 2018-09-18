//
//  WebTestViewController.m
//  SJRouter_Example
//
//  Created by BlueDancer on 2018/9/18.
//  Copyright © 2018年 changsanjiang@gmail.com. All rights reserved.
//

#import "WebTestViewController.h"

@interface WebTestViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation WebTestViewController

- (instancetype)initWithURL:(NSURL *)URL {
    self = [super init];
    if ( !self ) return nil;
    _URL = URL;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc] init];
    [self.view addSubview:_webView];
    _webView.frame = self.view.bounds;
    [_webView loadRequest:[NSURLRequest requestWithURL:_URL]];
    // Do any additional setup after loading the view.
}
@end
