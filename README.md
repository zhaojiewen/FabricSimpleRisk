# FabricSimpleRisk

[![CI Status](https://img.shields.io/travis/9152264/FabricSimpleRisk.svg?style=flat)](https://travis-ci.org/9152264/FabricSimpleRisk)
[![Version](https://img.shields.io/cocoapods/v/FabricSimpleRisk.svg?style=flat)](https://cocoapods.org/pods/FabricSimpleRisk)
[![License](https://img.shields.io/cocoapods/l/FabricSimpleRisk.svg?style=flat)](https://cocoapods.org/pods/FabricSimpleRisk)
[![Platform](https://img.shields.io/cocoapods/p/FabricSimpleRisk.svg?style=flat)](https://cocoapods.org/pods/FabricSimpleRisk)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

FabricSimpleRisk is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FabricSimpleRisk'
pod 'ForterSDK', :git => 'https://bitbucket.org/forter-mobile/forter-ios-sdk.git', :tag => "3.0.4"

```

## 用法

### 初始化SDK， 注意：中国大陆合规要求，只有同意了隐私协议才能进行初始化

### Swift Usage
```
            FabricSimpleRisk.start(providers: [.forter, .riskified, .trustDecision],
                               forterSiteId: "",
                               riskifiedShopName: "",
                               riskifiedSessionToken: "",
                               tdConfig: FabricTDConfig(isPrivacyAgree: true,
                                                        partner: "",
                                                        appKey: "",
                                                        country: ""))
```

### OC Usage
``` objc
            [FabricSimpleRisk startWithOptions: FabricSimpleRiskProviderOptionsForter | FabricSimpleRiskProviderOptionsRiskified | FabricSimpleRiskProviderOptionsTrustDecision forterSiteId:@"" riskifiedShopName:@"" riskifiedSessionToken:@"" tdConfig: [[FabricTDConfig alloc] initWithIsPrivacyAgree: true partner:@"" appKey:@"" country:@""]];
```

### 获取Token

```swift
        let forterToken = FabricSimpleRisk.getForterToken()
        debugPrint("forterToken: \(forterToken)")
        let tdBlackBox = FabricSimpleRisk.getBlackBox { blackBox in
            debugPrint("blackBox: \(blackBox)")

        }
```

``` objc
    NSLog(@"Forter SDK token %@", FabricSimpleRisk.getForterToken);
    [FabricSimpleRisk getBlackBoxWithBlock:^(NSString * _Nullable blackBox) {
        NSLog(@"blackBox:%@",blackBox);
    }];
```

## Author

9152264, haiqing.xu@ly.com

## License

FabricSimpleRisk is available under the MIT license. See the LICENSE file for more info.
