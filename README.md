[![Build Status](https://travis-ci.org/rolandoasmat/SwiftPromise.svg?branch=master)](https://travis-ci.org/rolandoasmat/SwiftPromise)

# SwiftPromise

Use the Promise pattern in Swift.

## Usage

Create the promise, specifying `Double` as the fulfillment object type.
```swift
// Init
let promise = Promise<Double>() { fulfill, reject in
    let result = 44.0
    // Fulfill the promise
    fulfill(result)
}
```

Do something with the promoise after it's settled.
```swift
promise.then({ (result) in
    print("Got the result!\n\(result)")
    expect.fulfill()
}) { (error) in
        print("Got an  error :(\n\(error.localizedDescription)")
    }
```

## Installation

### CocoaPods

Include `SwiftPromise` in your `Podfile`:

```ruby
platform :ios, '9.0'
use_frameworks!

target 'SampleApp' do
  pod 'SwiftPromise'
end
```

Then, install:

```bash
$ pod install
```

### Carthage

Coming soon!
