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
pod 'FabricSimpleRisk', '1.0.0'

```

## 用法

### 初始化SDK， 注意：中国大陆合规要求，只有同意了隐私协议才能进行初始化

```
        SimpleRisk.start(providers: [.forter, .riskified, .trustDecision],
                         forterSiteId: "",
                         riskifiedShopName: "",
                         riskifiedSessionToken: "",
                         tdConfig: FabricTDConfig(partner: "",
                                                  appKey: "",
                                                  country: ""))
```


### 获取Token

```     // Forter
        let forterToken = SimpleRisk.getForterToken()
        debugPrint("forterToken: \(String(describing: forterToken))")
        
        //同盾
        SimpleRisk.getBlackBox { blackBox in
            debugPrint("blackBox: \(String(describing: blackBox))")
        }
```

## 合规说明
请贵司在隐私政策弹窗等界面中告知以下合规说明

### 同盾 https://cn-doc.trustdecision.com/reference/ios-global#%E5%90%88%E8%A7%84%E8%AF%B4%E6%98%8E
### Forter https://docs.forter.com/mobile-sdks/sdk-data-compliance#VTJfc
### Riskified https://www.riskified.com/terms/#privacy

## Author

xuhaiqing, haiqing.xu@ly.com

## License

FabricSimpleRisk is available under the MIT license. See the LICENSE file for more info.
