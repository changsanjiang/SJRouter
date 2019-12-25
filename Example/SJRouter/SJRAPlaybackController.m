//
//  SJRAPlaybackController.m
//  SJArticleReader
//
//  Created by BlueDancer on 2018/12/3.
//  Copyright © 2018 畅三江. All rights reserved.
//

#import "SJRAPlaybackController.h"
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN
static NSNotificationName const SJRAPlaybackControllerPlaybackStatusDidChangeNotify =
@"SJRAPlaybackControllerPlaybackStatusDidChangeNotify";
static NSNotificationName const SJRAPlaybackControllerPlayDidToEndNofity =
@"SJRAPlaybackControllerPlayDidToEndNofity";

@interface SJRAPlaybackControllerObserver : NSObject<SJRAPlaybackControllerObserver>
@end

@implementation SJRAPlaybackControllerObserver
@synthesize playbackStatusDidChangeExeBlock = _playbackStatusDidChangeExeBlock;
@synthesize playDidToEndExeBlock = _playDidToEndExeBlock;

- (instancetype)initWithPlaybackController:(id<SJRAPlaybackController>)playbackController {
    self = [super init];
    if ( !self ) return nil;
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(playbackStatusDidChangeNotify:) name:SJRAPlaybackControllerPlaybackStatusDidChangeNotify object:playbackController];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(playbackControllerPlayDidToEndNofity:) name:SJRAPlaybackControllerPlayDidToEndNofity object:playbackController];
    return self;
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)playbackStatusDidChangeNotify:(NSNotification *)notify {
    if ( _playbackStatusDidChangeExeBlock ) _playbackStatusDidChangeExeBlock(notify.object);
}

- (void)playbackControllerPlayDidToEndNofity:(NSNotification *)notify {
    if ( _playDidToEndExeBlock ) _playDidToEndExeBlock(notify.object);
}
@end


@interface SJRAPlaybackController ()<AVSpeechSynthesizerDelegate>
@property (nonatomic, strong, readonly) AVSpeechSynthesizer *synthesizer;
@property (nonatomic, strong, nullable) AVSpeechUtterance *untterance;
@property (nonatomic) SJRAPlaybackStatus playbackStatus;
@end

@implementation SJRAPlaybackController
- (instancetype)init {
    self = [super init];
    if ( !self ) return nil;
    _synthesizer = [AVSpeechSynthesizer new];
    _synthesizer.delegate = self;
    return self;
}

- (void)playWithContent:(NSString *)content {
    [self stop];
    _untterance = [[AVSpeechUtterance alloc] initWithString:content];
    [self play];
}

- (void)play {
    if ( !_untterance ) return;
    [_synthesizer speakUtterance:_untterance];
    self.playbackStatus = SJRAPlaybackStatusPlaying;
}

- (void)pause {
    if ( !_untterance ) return;
    [_synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryWord];
    self.playbackStatus = SJRAPlaybackStatusPaused;
}

- (void)stop {
    [_synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
    _untterance = nil;
    self.playbackStatus = SJRAPlaybackStatusUnknown;
}

- (nonnull id<SJRAPlaybackControllerObserver>)getObserver {
    return [[SJRAPlaybackControllerObserver alloc] initWithPlaybackController:self];
}

- (void)setPlaybackStatus:(SJRAPlaybackStatus)playbackStatus {
    if ( playbackStatus == _playbackStatus ) return;
    _playbackStatus = playbackStatus;
    [NSNotificationCenter.defaultCenter postNotificationName:SJRAPlaybackControllerPlaybackStatusDidChangeNotify
                                                      object:self];
}

#pragma mark -
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    [NSNotificationCenter.defaultCenter postNotificationName:SJRAPlaybackControllerPlayDidToEndNofity object:self];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance {
    NSLog(@"%@", [_untterance.speechString substringWithRange:characterRange]);
}
@end
NS_ASSUME_NONNULL_END
