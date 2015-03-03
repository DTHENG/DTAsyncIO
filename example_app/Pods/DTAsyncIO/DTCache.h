//
//  DTCache.h
//  DTAsyncIO
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTCache : NSObject

+ (void)set:(NSData *)value forKey:(NSString *)key;
+ (NSData *)get:(NSString *)key;
+ (void)remove:(NSString *)key;

@end
