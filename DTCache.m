//
//  DTCache.m
//  DTAsyncIO
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import "DTCache.h"

static NSCache *CachedData;

@implementation DTCache

+ (void)initialize {
    [super initialize];
    
    CachedData = [[NSCache alloc] init];
}

+ (void)set:(NSData *)value forKey:(NSString *)key {
    [CachedData setObject:value forKey:key];
}

+ (NSData *)get:(NSString *)key {
    return [CachedData objectForKey:key];
}

+ (void)remove:(NSString *)key {
    [CachedData removeObjectForKey:key];
}

@end
