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

+ (void)read:(NSUInteger)type success:(void (^)(NSDictionary *data))success failure:(void (^)(NSError *))error {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        @try {
            NSString *cacheKey = [NSString stringWithFormat:@"core-cache-%lu", (unsigned long)type];

            if ([DTCache get:cacheKey] != nil) {

                if (success) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        success((NSDictionary *)[NSKeyedUnarchiver unarchiveObjectWithData:[DTCache get:cacheKey]]);
                    });
                }
                return;
            }
            
            NSUserDefaults *diskData = [NSUserDefaults standardUserDefaults];
            
            NSString *key = [self toKey:type];
            
            NSDictionary *values = [diskData objectForKey:key];
            
            if (values == nil) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (success) {
                        success([[NSDictionary alloc] init]);
                    }
                });
                return;
            }
            
            [DTCache set:[NSKeyedArchiver archivedDataWithRootObject:values] forKey:cacheKey];
            
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(values);
                });
            }
        }
        @catch (NSException *e) {
            if (error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    error([[NSError alloc] initWithDomain:@"DTAsyncIO" code:2 userInfo:@{@"message": [NSString stringWithFormat:@"%@", e]}]);
                });
            }
        }
    });
}

+ (void)write:(NSDictionary *)data forType:(NSUInteger)type success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))error {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        @try {
            
            NSString *cacheKey = [NSString stringWithFormat:@"core-cache-%lu", (unsigned long)type];
            
            [DTCache set:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:cacheKey];
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            
            NSString *key = [self toKey:type];
            if (key == nil) {
                
                if (error) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                            error([[NSError alloc] initWithDomain:@"DTAsyncIO" code:1 userInfo:@{@"message": @"Error generating key"}]);
                    });
                }
                return;
            }
            [prefs setObject:data forKey:key];
            [prefs synchronize];
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    success(data);
                });
            }
        }
        @catch (NSException *e) {
            if (error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    error([[NSError alloc] initWithDomain:@"DTAsyncIO" code:2 userInfo:@{@"message": [NSString stringWithFormat:@"%@", e]}]);
                });
            }
        }
    });
}

+ (NSString *)toKey:(NSUInteger)type {
    return [NSString stringWithFormat:@"%lu", (unsigned long)type];
}

@end
