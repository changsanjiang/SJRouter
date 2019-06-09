//
//  MB2ViewController.m
//  ModuleB
//
//  Created by BlueDancer on 2019/6/9.
//

#import "MB2ViewController.h"

@interface MB2ViewController ()

@end

@implementation MB2ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MBModule B2 ViewController";
    
    self.view.backgroundColor =  [UIColor colorWithRed:arc4random() % 256 / 255.0
                                                 green:arc4random() % 256 / 255.0
                                                  blue:arc4random() % 256 / 255.0
                                                 alpha:1];
}
@end
