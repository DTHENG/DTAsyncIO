//
//  DTObservable.h
//  DTObservable
//
//  Created by Daniel Thengvall on 3/2/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTSubscriber.h"    

@interface DTObservable : NSObject 

- (void)subscribe;
- (void)subscribe:(DTSubscriber *)subscriber;
- (void (^)(DTSubscriber *))new;
- (DTObservable *)init:(void (^)(DTSubscriber *))observable;
- (DTObservable *)newThread;
- (DTObservable *)flatMap:(DTObservable * (^)(id))block;
- (DTObservable *)filter:(BOOL (^)(id))block;

+ (DTObservable *)zip:(DTObservable *)observable1 :(DTObservable *)observable2 :(id (^)(id, id))block;
+ (DTObservable *)zip:(DTObservable *)observable1 :(DTObservable *)observable2 :(DTObservable *)observable3 :(id (^)(id, id, id))block;
+ (DTObservable *)zip:(DTObservable *)observable1 :(DTObservable *)observable2 :(DTObservable *)observable3 :(DTObservable *)observable4 :(id (^)(id, id, id, id))block;
+ (DTObservable *)zip:(DTObservable *)observable1 :(DTObservable *)observable2 :(DTObservable *)observable3 :(DTObservable *)observable4 :(DTObservable *)observable5 :(id (^)(id, id, id, id, id))block;
+ (DTObservable *)zip:(DTObservable *)observable1 :(DTObservable *)observable2 :(DTObservable *)observable3 :(DTObservable *)observable4 :(DTObservable *)observable5 :(DTObservable *)observable6 :(id (^)(id, id, id, id, id, id))block;
+ (DTObservable *)zip:(DTObservable *)observable1 :(DTObservable *)observable2 :(DTObservable *)observable3 :(DTObservable *)observable4 :(DTObservable *)observable5 :(DTObservable *)observable6 :(DTObservable *)observable7 :(id (^)(id, id, id, id, id, id, id))block;
+ (DTObservable *)zip:(DTObservable *)observable1 :(DTObservable *)observable2 :(DTObservable *)observable3 :(DTObservable *)observable4 :(DTObservable *)observable5 :(DTObservable *)observable6 :(DTObservable *)observable7 :(DTObservable *)observable8 :(id (^)(id, id, id, id, id, id, id, id))block;
+ (DTObservable *)zip:(DTObservable *)observable1 :(DTObservable *)observable2 :(DTObservable *)observable3 :(DTObservable *)observable4 :(DTObservable *)observable5 :(DTObservable *)observable6 :(DTObservable *)observable7 :(DTObservable *)observable8 :(DTObservable *)observable9 :(id (^)(id, id, id, id, id, id, id, id, id))block;
+ (DTObservable *)zip:(DTObservable *)observable1 :(DTObservable *)observable2 :(DTObservable *)observable3 :(DTObservable *)observable4 :(DTObservable *)observable5 :(DTObservable *)observable6 :(DTObservable *)observable7 :(DTObservable *)observable8 :(DTObservable *)observable9 :(DTObservable *)observable10 :(id (^)(id, id, id, id, id, id, id, id, id, id))block;
+ (DTObservable *)just:(id)object;
+ (DTObservable *)empty;
+ (DTObservable *)concat:(NSArray *)arrayOfObservables;
+ (DTObservable *)create:(void (^)(DTSubscriber *))observer;

@end
