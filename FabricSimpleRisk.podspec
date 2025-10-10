#
# Be sure to run `pod lib lint FabricSimpleRisk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FabricSimpleRisk'
  s.version          = '1.0.0'
  s.summary          = '提供统一接口以启动多个风控 SDK（Forter、Riskified、同盾 TrustDecision）.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  提供统一接口以启动多个风控 SDK（Forter、Riskified、同盾 TrustDecision）.
  方便接入不同的风控SDK，保证接口的稳定性
                       DESC

  s.homepage         = 'https://github.com/zhaojiewen/FabricSimpleRisk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xuhaiqing' => 'haiqing.xu@ly.com' }
  s.source           = { :git => 'https://github.com/zhaojiewen/FabricSimpleRisk.git', :tag => s.version.to_s }
  s.frameworks = 'Foundation', 'CoreFoundation', 'CFNetwork', 'SystemConfiguration',  'CoreTelephony',  'UIKit'
  
  s.static_framework = true
  s.swift_versions = ['5.0', '5.5', '5.9']
  s.platform = :ios, '12.0'
  s.source_files = 'FabricSimpleRisk/Classes/**/*.swift'

  s.ios.vendored_frameworks = 'FabricSimpleRisk/Classes/ForterSDK/xcframeworks/ForterSDK.xcframework', 'FabricSimpleRisk/Classes/ForterSDK/xcframeworks/FTRAuth.xcframework', 'FabricSimpleRisk/Classes/ForterSDK/xcframeworks/FTRCommon.xcframework'
  
  s.dependency 'RiskifiedBeaconXCFramework', '1.3.2'
  s.dependency 'TrustDecisionPro', '5.2.0'

end
