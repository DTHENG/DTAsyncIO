# DTAsyncIO

[![CI Status](http://img.shields.io/travis/DTHENG/DTAsyncIO.svg?style=flat)](https://travis-ci.org/DTHENG/DTAsyncIO)

## Usage

Create an enum in your project to serve as your object types, something like:

ExampleDataType.h

````obj-c
#import <Foundation/Foundation.h>

typedef enum ExampleDataType : NSUInteger {

	TEST_TYPE

	// todo: add more here

} ExampleDataType;
````
	
ExampleImplementation.m

````obj-c
#import "ExampleDataType.h"
#import "DTAsyncIO.h"

...

- (void)writeExample() {
			
	[DTAsyncIO write:@{@"4": @(20)} forType:TEST_TYPE success:^(NSDictionary *data) {
	
		BOOL fourTwenty = [data[@"4"] intValue] == 20;
		
		NSLog(@"does 4 == 20? %@", fourTwenty ? @"YES" : @"NO");
		
	} failure:^(NSError *error) {
		Log(@"Error! %@", error);
	}];
}

- (void)readExample() {
	
	[DTAsyncIO read:TEST_TYPE success:^(NSDictionary *data) {
	
		NSLog(@"%@", data[@"4"]); // 20
		
	} failure:^(NSError *error) {
		Log(@"Error! %@", error);
	}];
}
````

## Requirements

- iOS 8 or greater

## Installation

DTAsyncIO is available through GitHub. To install
it, simply add the following line to your Podfile:

````ruby
pod 'DTAsyncIO', :git => 'https://github.com/DTHENG/DTAsyncIO.git'
````

## Author

DTHENG, fender5289@gmail.com

## License

DTAsyncIO is available under the MIT license. See the LICENSE file for more info.

