//
//  DTAsyncIO.h
//  DTAsyncIO
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DTObservable;

@interface DTAsyncIO : NSObject

+ (DTObservable *)read:(NSUInteger)type;

+ (DTObservable *)write:(NSDictionary *)data forType:(NSUInteger)type;

@end
