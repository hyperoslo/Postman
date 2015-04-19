![Postman](https://raw.githubusercontent.com/hyperoslo/Postman/master/Assets/cover.png)

[![CI Status](http://img.shields.io/travis/hyperoslo/Postman.svg?style=flat)](https://travis-ci.org/hyperoslo/Postman)
[![Version](https://img.shields.io/cocoapods/v/Postman.svg?style=flat)](http://cocoadocs.org/docsets/Postman)
[![License](https://img.shields.io/cocoapods/l/Postman.svg?style=flat)](http://cocoadocs.org/docsets/Postman)
[![Platform](https://img.shields.io/cocoapods/p/Postman.svg?style=flat)](http://cocoadocs.org/docsets/Postman)

## Usage

```swift
postman!.sendMailTo(
  "olivia@louise.com",
  subject: "Hi",
  body: "Livy Darling, \n\nI am grateful — grate-fuller than ever before — that you were born, & that your love is mine & our two lives woven & melded together! \n\n- SLC",
  attachment: nil,
  usingController: self)

postman!.delegate = self

func postmanDidFinish(postman: Postman!) {
  println("postmanDidFinish!")
}
```

![Image](https://raw.githubusercontent.com/hyperoslo/Postman/master/Assets/screens.png)

## Installation

**Postman** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Postman'
```

## Author

Hyper Interaktiv AS, ios@hyper.no

## License

**Postman** is available under the MIT license. See the LICENSE file for more info.
