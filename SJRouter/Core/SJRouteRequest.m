//
//  SJRouteRequest.m
//  Pods
//
//  Created by 畅三江 on 2018/9/14.
//

#import "SJRouteRequest.h"

NS_ASSUME_NONNULL_BEGIN
@implementation SJRouteRequest
- (instancetype)initWithURL:(NSURL *)URL {
    SJParameters parameters = nil;
    NSURLComponents *c = [[NSURLComponents alloc] initWithURL:URL resolvingAgainstBaseURL:YES];
    if ( 0 != c.queryItems.count ) {
        NSMutableDictionary *m = [NSMutableDictionary new];
        for ( NSURLQueryItem *item in c.queryItems ) {
            m[item.name] = item.value;
        }
        parameters = m.copy;
    }
    return [self initWithPath:URL.path parameters:parameters];
}

- (instancetype)initWithPath:(NSString *)rp parameters:(nullable SJParameters)prts {
    self = [super init];
    if ( !self ) return nil;
    while ( [rp hasPrefix:@"/"] ) rp = [rp substringFromIndex:1];
    _requestPath = rp.copy;
    _prts = prts;
    return self;
}

- (NSString *)description {
    return
    [NSString stringWithFormat:@"[%@<%p>] {\n \
     requestPath = %@; \n \
     displayType = %ld; \n \
     parameters = %@; \n \
     }", NSStringFromClass([self class]), self, _requestPath, (long)_displayType, _prts];
}
@end
NS_ASSUME_NONNULL_END
