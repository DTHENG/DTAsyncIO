//
//  DTAsyncIO.h
//  DTAsyncIO
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DTObservable/DTObservable.h>
#import <DTObservable/DTSubscriber.h>

@interface DTAsyncIO : NSObject

+ (DTObservable *)read:(NSUInteger)type;

+ (DTObservable *)write:(NSDictionary *)data forType:(NSUInteger)type;

@end
