# DTAsyncIO

[![CI Status](http://img.shields.io/travis/DTHENG/DTAsyncIO.svg?style=flat)](https://travis-ci.org/DTHENG/DTAsyncIO)
[![Version](https://img.shields.io/cocoapods/v/DTAsyncIO.svg?style=flat)](http://cocoadocs.org/docsets/DTAsyncIO)
[![License](https://img.shields.io/cocoapods/l/DTAsyncIO.svg?style=flat)](http://cocoadocs.org/docsets/DTAsyncIO)
[![Platform](https://img.shields.io/cocoapods/p/DTAsyncIO.svg?style=flat)](http://cocoadocs.org/docsets/DTAsyncIO)

## Usage

Create an enum in your project to serve as your object types, something like:

_ExampleDataType.h_ [view file](example_app/DTAsyncIOTest/ExampleDataType.h)

```obj-c
#import <Foundation/Foundation.h>

typedef enum ExampleDataType : NSUInteger {

	TEST_TYPE

	// todo: add more

} ExampleDataType;
```
	
_Example.m_ [view file](example_app/DTAsyncIOTest/Example.m)

```obj-c
#import "DTAsyncIO.h"
#import "ExampleDataType.h"
#import "DTObservable.h"

...

- (void)writeExample {

    [[DTAsyncIO write:@{@"4": @20} forType:TEST_TYPE] subscribe:[[DTSubscriber alloc] init:^(NSDictionary *data) {

        BOOL fourTwenty = [data[@"4"] intValue] == 20;

        NSLog(@"does 4 == 20? %@", fourTwenty ? @"YES" : @"NO");

    } onError:^(NSError *error) {
        NSLog(@"Error! %@", error);
    }]];
}

- (void)readExample {

    [[DTAsyncIO read:TEST_TYPE] subscribe:[[DTSubscriber alloc] init:^(NSDictionary *data) {

        NSLog(@"%@", data[@"4"]); // 20

    } onError:^(NSError *error) {
        NSLog(@"Error! %@", error);
    }]];
}
```

## Requirements

- iOS 8 or greater

## Installation

DTAsyncIO is available through GitHub. To install it, simply add the following line to your Podfile:

```ruby
pod 'DTAsyncIO', '0.2.3'
```

#### Dont have a Podfile? 

You can easily update your project to use CocoaPods:

- Install the CocoaPods library:
```sh
sudo gem install cocoapods
```
- Go to the directory where your __.xcodeproj__ file is
- Create a new file called __Podfile__
- Update _Podfile_ with:
```ruby
platform :ios, deployment_target: '8.0'

pod 'DTAsyncIO', '0.2.3'
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

