[![Build Status](https://travis-ci.org/rolandoasmat/SwiftPromise.svg?branch=master)](https://travis-ci.org/rolandoasmat/SwiftPromise)

# SwiftPromise

Use this library to create a thenable Promise.

## Usage

Create the promise
```swift
// Init
let promise = Promise<Double>() { fulfill, reject in
    let result = 44.0
    // Fulfill the promise
    fulfill(result)
}
```

Respond to error or result
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

Include `SwiftPromise` in your `Podfile`

```ruby
platform :ios, '9.0'
use_frameworks!

target 'SampleApp' do
  pod 'SwiftPromise'
end
```

Then, install

```bash
$ pod install
```

### Carthage

Coming soon!
