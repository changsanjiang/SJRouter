//
//  WebTestViewController.h
//  SJRouter_Example
//
//  Created by BlueDancer on 2018/9/18.
//  Copyright © 2018年 changsanjiang@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@import SJRouter;

NS_ASSUME_NONNULL_BEGIN
@interface WebTestViewController : UIViewController
- (instancetype)initWithURL:(NSURL *)URL;
@property (nonatomic, strong, readonly) NSURL *URL;
@end
NS_ASSUME_NONNULL_END
