# DTAsyncIO

[![CI Status](http://img.shields.io/travis/DTHENG/DTAsyncIO.svg?style=flat)](https://travis-ci.org/DTHENG/DTAsyncIO)

## Usage

Create an enum in your project to serve as your object types, something like:

_ExampleDataType.h_

```obj-c
#import <Foundation/Foundation.h>

typedef enum ExampleDataType : NSUInteger {

	TEST_TYPE

	// todo: add more here

} ExampleDataType;
```
	
_ExampleImplementation.m_

```obj-c
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
```

## Requirements

- iOS 8 or greater

## Installation

DTAsyncIO is available through GitHub. To install it, simply add the following line to your Podfile:

```ruby
pod 'DTAsyncIO', :git => 'https://github.com/DTHENG/DTAsyncIO.git'
```

Dont have a Podfile? You can easily update your project to use CocoaPods by following these steps:

- Install CocoaPods library:
```sh
sudo gem install cocoapods
```
- Go to the directory where you have your __.xcodeproj__ file
- Create a new file called __Podfile__:
```ruby
platform :ios, deployment_target: '8.0'

pod 'DTAsyncIO', :git => 'https://github.com/DTHENG/DTAsyncIO.git'
```
- Now run this command:
```sh
pod install
```
- From now on only open the __.xcworkspace__ file in your project _NOT_ __.xcodeproj__
- Done!

## Author

DTHENG, fender5289@gmail.com

## License

DTAsyncIO is available under the MIT license. See the LICENSE file for more info.

