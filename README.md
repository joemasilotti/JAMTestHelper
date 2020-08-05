> This project has been archived and is now read-only. The added features are now built in to Xcode.

# JAMTestHelper

> Requires Xcode 7.2

A few additions to XCTest geared towards UI Testing in Xcode 7 and iOS 9.

```swift
- (void)testLikeButton {
    let button = app.buttons["Like"]

    button.tap()
    waitForActivityIndicatorToFinish()

    let label = app.staticTexts["1 like"]
    waitForElementToExist(label)

    button.tap()
    waitForElementToNotExist(label)
}
```

## Helpers

- `waitForElementToExist()` - waits until `element.exists` is true
- `waitForElementToNotExist()` - waits until `element.exists` is false
- `waitForActivityIndicatorToFinish()` - waits until the (assumed) only activity indicator stops animating

Both of these helpers work by ticking the run loop a tenth of a second in between checks. If the element does not meet the condition after two seconds an exception is raised.

Exceptions are used over `XCTFail()` so the tests' tests, `JAMTestHelperTests.swift` can run valid assertions. See that file for more details.

## Installation

### CocoaPods (recommended)

1. Install [CocoaPods](http://cocoapods.org/) with `gem install cocoapods`.
1. `pod init`
1. In your Podfile, add `JAMTestHelper` to your UI Testing target

```ruby
target 'UI Tests' do
  pod 'JAMTestHelper'
end
```

### Manual

Clone this repo and drag and drop `JAMTestHelper.swift` into your UI Testing target. You can then reference the methods inside of an `XCTestCase` as shown in the example.

## Notes

This project was heavily inspired by my [write-up on UI Testing](http://masilotti.com/ui-testing-xcode-7) and [DHTestingAdditions](https://github.com/daniel-hall/DHTestingAdditions).
