# CentrifugeiOS

[![Build Status](https://travis-ci.org/centrifugal/centrifuge-ios.svg?branch=develop)](https://travis-ci.org/centrifugal/centrifuge-ios)
[![Version](https://img.shields.io/cocoapods/v/CentrifugeiOS.svg?style=flat)](http://cocoapods.org/pods/CentrifugeiOS)
[![License](https://img.shields.io/cocoapods/l/CentrifugeiOS.svg?style=flat)](http://cocoapods.org/pods/CentrifugeiOS)
[![Platform](https://img.shields.io/cocoapods/p/CentrifugeiOS.svg?style=flat)](http://cocoapods.org/pods/CentrifugeiOS)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first. You could chat with [here](http://jsfiddle.net/FZambia/yG7Uw/) and command from [Centrifugal web](https://centrifugo.herokuapp.com/)

## Usage

Create client: 

```swift
let timestamp = "\(Int(NSDate().timeIntervalSince1970))"

let creds = CentrifugeCredentials(secret: secret, user: user, timestamp: timestamp)
let url = "wss://centrifugo.herokuapp.com/connection/websocket"
client = Centrifuge.client(url, creds: creds, delegate: self)
```
Connect to server:
```swift
client.connect { message, error in }
```
Subscribe to channel:
```swift
client.subscribe(channel, delegate: delegate) { message, error in }
```
Publish: 
```swift
client.publish(channel, data:  data) { message, error in }
```

See the example project and [docs](https://fzambia.gitbooks.io/centrifugal/content/server/client_protocol.html) for more information.

## Requirements

* Version 0.1.0: Swift 2.2, iOS 8.0+
* Version 1.0.0: Swift 2.3, iOS 8.0+

## Installation

CentrifugeiOS is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CentrifugeiOS"
```

## Author

German Saprykin, saprykin.h@gmail.com

## License

CentrifugeiOS is available under the MIT license. See the LICENSE file for more info.
