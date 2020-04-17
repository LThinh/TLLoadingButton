# TLLoadingButton
UIButton subclass to represent loading state

[![Travis CI](https://api.travis-ci.org/LThinh/TLLoadingButton.svg?branch=master)](https://travis-ci.org/github/LThinh/TLLoadingButton)
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/TLLoadingButton.svg)](https://cocoapods.org/pods/TLLoadingButton)
[![Platform](https://img.shields.io/badge/platforms-iOS-333333.svg)](http://cocoapods.org/pods/TLLoadingButton)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

Sometimes we need to show loading on button as per requirement we don't want to block full screen view with default loading or dialogs. So you can use this library to show loading on button hide loading after that when you want.

[![Demo](https://i.gyazo.com/7a4ebd62cb6f34abc02ad4c2d6def527.gif)](https://gyazo.com/7a4ebd62cb6f34abc02ad4c2d6def527)

## Features

- [x] Shows/Hides spiner to indicate loading state
- [x] Custom your own loading animation
- [x] Shows an optional title while loading
- [x] Configures directly on storyboard/xibs or constructs loading button programmatically

## Requirements

- iOS 11.0+
- Swift 5.0

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `TLLoadingButton` by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!
pod 'TLLoadingButton', '1.0.1'
```

To get the full benefits import `TLLoadingButton` wherever you import UIKit

``` swift
import UIKit
import TLLoadingButton
```
#### Carthage
Simply add this line to your `Cartfile` and run `carthage update`.

```
github "LThinh/TLLoadingButton" ~ 1.0.1
```
#### Manually
1. Download and drop ```TLLoadingButton.swift``` in your project.  
2. Congratulations!

## Usage example

1. import `TLLoadingButton` to your project
```
import TLLoadingButton
```

2. Create and configure loading button
```swift

// Create Loading button
let frame = CGRect(x: 0, y: 0, width: 300, height: 40)
let signInButton = TLLoadingButton(frame: frame)
signInButton.setTitle("Sign In", for: .normal)
signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
signInButton.setTitleColor(.red, for: .normal)
signInButton.layer.borderColor = UIColor.red.cgColor
signInButton.layer.borderWidth = 1
signInButton.layer.cornerRadius = 20

// Setting loading title
signInButton.loadingTitle = "Processing..."

// Set spacing between `loading title` and `animated view`
signInButton.spacing = 12

// In case of creating loading button programmatically, You must call this function to finish all set up
signInButton.finishSetUp()

func signIn() {
  // API Call
}
```

Or you can drag a `UIView` to your storyboard/xib file and set its class to `TLLoadingButton`
[![Set custom class](https://i.gyazo.com/4c31f2846ac127827394fc8080009f2a.png)](https://gyazo.com/4c31f2846ac127827394fc8080009f2a)[![Image from Gyazo](https://i.gyazo.com/87be64760657cd37b5fb11cee6d3aaec.png)](https://gyazo.com/87be64760657cd37b5fb11cee6d3aaec)

3. Start animating:
```
signInButton.startLoading()
```

By default we use an `UIActivityIndicatorView` to show animation, you can provide your own custom `Loading View` and set it to `animatedView`. In that case, your custom class must be adapted `TLLoadingDelegate`.

4. Stop animating
```
signInButton.stopLoading()
```

## Contribute

We would love you for the contribution to **TLLoadingButton**, check the ``LICENSE`` file for more info.

## Information

Copyright © 2020 Thinh Le – [@Facebook](https://www.facebook.com/LLThinh)

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/LThinh/TLLoadingButton](https://github.com/LThinh/TLLoadingButton)

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
