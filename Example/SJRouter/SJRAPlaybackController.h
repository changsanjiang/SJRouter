//
//  SJRAPlaybackController.h
//  SJArticleReader
//
//  Created by BlueDancer on 2018/12/3.
//  Copyright © 2018 畅三江. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "SJRAPlaybackHeader.h"
@protocol SJRAPlaybackControllerObserver, SJRAPlaybackController;

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    SJRAPlaybackStatusUnknown,
    SJRAPlaybackStatusPlaying,
    SJRAPlaybackStatusPaused,
} SJRAPlaybackStatus;

@protocol SJRAPlaybackController <NSObject>
- (id<SJRAPlaybackControllerObserver>)getObserver;
@property (nonatomic, readonly) SJRAPlaybackStatus playbackStatus;
- (void)playWithContent:(NSString *)content;
- (void)play;
- (void)pause;
- (void)stop;
@end

@protocol SJRAPlaybackControllerObserver <NSObject>
- (instancetype)initWithPlaybackController:(id<SJRAPlaybackController>)playbackController;
@property (nonatomic, copy, nullable) void(^playbackStatusDidChangeExeBlock)(id<SJRAPlaybackController> controller);
@property (nonatomic, copy, nullable) void(^playDidToEndExeBlock)(id<SJRAPlaybackController> controller);
@end

@interface SJRAPlaybackController : NSObject<SJRAPlaybackController>
- (id<SJRAPlaybackControllerObserver>)getObserver;
@property (nonatomic, readonly) SJRAPlaybackStatus playbackStatus;
- (void)playWithContent:(NSString *)content;
- (void)play;
- (void)pause;
- (void)stop;
@end
NS_ASSUME_NONNULL_END
