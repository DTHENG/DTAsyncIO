//
//  DTAsyncIO.m
//  DTAsyncIO
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import "DTAsyncIO.h"
#import "DTCache.h"

@implementation DTAsyncIO

+ (DTObservable *)read:(NSUInteger)type {

    return [[DTObservable alloc] init:^(DTSubscriber *subscriber) {
        @try {
            NSString *cacheKey = [NSString stringWithFormat:@"core-cache-%lu", (unsigned long)type];
            if ([DTCache get:cacheKey] != nil) {
                [subscriber complete:(NSDictionary *)[NSKeyedUnarchiver unarchiveObjectWithData:[DTCache get:cacheKey]]];
                return;
            }
            NSUserDefaults *diskData = [NSUserDefaults standardUserDefaults];
            NSDictionary *values = [diskData objectForKey:[self toKey:type]];
            if (values == nil) {
                [subscriber complete:[[NSDictionary alloc] init]];
                return;
            }
            [DTCache set:[NSKeyedArchiver archivedDataWithRootObject:values] forKey:cacheKey];
            [subscriber complete:values];
        }
        @catch (NSException *e) {
            [subscriber error:[[NSError alloc] initWithDomain:@"DTAsyncIO" code:2 userInfo:@{@"message": [NSString stringWithFormat:@"%@", e]}]];
        }
    }];
}

+ (DTObservable *)write:(NSDictionary *)data forType:(NSUInteger)type {
    return [[DTObservable alloc] init:^(DTSubscriber *subscriber) {
        @try {
            NSString *cacheKey = [NSString stringWithFormat:@"core-cache-%lu", (unsigned long)type];
            [DTCache set:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:cacheKey];
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            NSString *key = [self toKey:type];
            if (key == nil) {
                [subscriber error:[[NSError alloc] initWithDomain:@"DTAsyncIO" code:1 userInfo:@{@"message": @"Error generating key"}]];
                return;
            }
            [prefs setObject:data forKey:key];
            [prefs synchronize];
            [subscriber complete:data];
        }
        @catch (NSException *e) {
            [subscriber error:[[NSError alloc] initWithDomain:@"DTAsyncIO" code:2 userInfo:@{@"message": [NSString stringWithFormat:@"%@", e]}]];
        }
    }];
}

+ (NSString *)toKey:(NSUInteger)type {
    return [NSString stringWithFormat:@"%lu", (unsigned long)type];
}

@end
