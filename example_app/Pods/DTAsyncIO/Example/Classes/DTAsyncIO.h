//
//  DTAsyncIO.h
//  DTAsyncIO
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTAsyncIO : NSObject

+ (void)read:(NSUInteger)type
     success:(void (^)(NSDictionary *data))success
     failure:(void (^)(NSError *))error;

+ (void)write:(NSDictionary *)data
      forType:(NSUInteger)type
      success:(void (^)(NSDictionary *))success
      failure:(void (^)(NSError *))error;

@end
