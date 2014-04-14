# AUAccount

AUAccount is simple class that help to manage user's account assing to application.

## Usage


To register new account use:

```
// shared account object
AUAccount *account = [AUAccount account];

// perform registration
[account registerAccountWithAuthenticationToken:token
								  expirationDate:date
                                    accountType:AUAccountTypeCustom
                                          error:&error];
```

To assing user's data to account use:

```
// prepare example user description object
NSDictionary *params = @{
    @"name": @"John",
    @"surname": @"Smith"
};

// update account's user object
[account updateUser:params];
```

## Requirements

AUAccount requires Xcode 5, targeting either iOS 6.0 and above

## Installation

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like AUAccount in your projects.

### Podfile

```ruby
platform :ios, '7.0'
pod "AUAccount", "~> 0.2"
```

## Author

emil.wojtaszek, emil@appunite.com
AppUnite.com

## License

AUAccount is available under the MIT license. See the LICENSE file for more info.

