# JAMTestHelper

A few additions to XCTest geared towards UI Testing in Xcode 7 and iOS 9.

## Helpers

- `waitForElementToExist:` - waits until `element.exists` returns `YES`
- `waitForElementToNotExist:` - waits until `element.exists` returns `NO`
- `waitForActivityIndicatorToFinish` - waits until the (assumed) only activity indicator stops animating

Both of these helpers work by ticking the run loop a tenth of a second in between checks. If the element does not meet the condition after two seconds an exception is raised.

Exceptions are used over `XCTFail()` so the tests' tests, [`JAMTestHelperTests.m`](UI Tests/JAMTestHelperTests.m), can run valid assertions. See that file for more details.

## Usage

Clone this repo and drag and drop `XCTestCase+JAMTestHelper.h` and `XCTestCase+JAMTestHelper.m` into your UI Testing target. Import the header and call the methods on `self` inside of an `XCTestCase`.

## Notes

This project was heavily inspired by my [write-up on UI Testing](http://masilotti.com/ui-testing-xcode-7) and [DHTestingAdditions](https://github.com/daniel-hall/DHTestingAdditions).
