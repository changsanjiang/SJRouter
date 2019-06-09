//
//  MA2ViewController.m
//  ModuleA
//
//  Created by BlueDancer on 2019/6/9.
//

#import "MA2ViewController.h"

@interface MA2ViewController ()

@end

@implementation MA2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MAModule A2 ViewController";
    
    self.view.backgroundColor =  [UIColor colorWithRed:arc4random() % 256 / 255.0
                                                 green:arc4random() % 256 / 255.0
                                                  blue:arc4random() % 256 / 255.0
                                                 alpha:1];
}
@end
