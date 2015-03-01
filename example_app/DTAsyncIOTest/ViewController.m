//
//  ViewController.m
//  DTAsyncIOTest
//
//  Created by Daniel Thengvall on 3/1/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import "ViewController.h"
#import "DTAsyncIO.h"
#import "ExampleDataType.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self writeExample];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self readExample];
}

- (void)writeExample {
    
    [DTAsyncIO write:@{@"4": @(20)} forType:TEST_TYPE success:^(NSDictionary *data) {
        
        BOOL fourTwenty = [data[@"4"] intValue] == 20;
        
        NSLog(@"does 4 == 20? %@", fourTwenty ? @"YES" : @"NO");
        
    } failure:^(NSError *error) {
        NSLog(@"Error! %@", error);
    }];
}

- (void)readExample {
    
    [DTAsyncIO read:TEST_TYPE success:^(NSDictionary *data) {
        
        NSLog(@"%@", data[@"4"]); // 20
        
    } failure:^(NSError *error) {
        NSLog(@"Error! %@", error);
    }];
}

@end
