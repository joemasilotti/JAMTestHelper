Pod::Spec.new do |s|
  s.name         = "JAMTestHelper"
  s.version      = "0.0.1"
  s.summary      = "A few additions to XCTest geared towards UI Testing in Xcode 7 and iOS 9."
  s.description  = <<-DESC
                  UI Testing in Xcode 7 doesn't offer any way to wait for elements to exist.

                  This adds a few helper methods to `XCTestCase`, such as:

                  * `waitForElementToExist:` - waits until `element.exists` returns `YES`
                  * `waitForElementToNotExist:` - waits until `element.exists` returns `NO`
                  * `waitForActivityIndicatorToFinish` - waits until the (assumed) only activity indicator stops animating
                   DESC
  s.license      = { type: "MIT", file: "LICENSE" }

  s.homepage         = "https://github.com/joemasilotti/JAMTestHelper.git"
  s.author           = { "Joe Masilotti" => "joe@masilotti.com" }
  s.social_media_url = "http://twitter.com/joemasilotti"

  s.platform  = :ios, "9.0"
  s.source    = { git: "https://github.com/joemasilotti/JAMTestHelper.git", tag: "0.0.1" }
  s.framework = "XCTest"

  s.source_files  = "JAM Test Helper"
  s.public_header_files = "JAM Test Helper/**/*.h"
end
