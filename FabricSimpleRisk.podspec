#
# Be sure to run `pod lib lint FabricSimpleRisk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FabricSimpleRisk'
  s.version          = '0.1.0'
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
  s.source           = { :git => 'git@github.com:zhaojiewen/FabricSimpleRisk.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.static_framework = true
  s.swift_versions = ['5.0', '5.5', '5.9']
  
  s.subspec 'Core' do |ss|
      ss.source_files = 'FabricSimpleRisk/Classes/Core/**/*'
  end
  
  s.subspec 'ForterSDK' do |ss|
      ss.source_files = 'FabricSimpleRisk/Classes/ForterSDK/**/*'
      ss.dependency 'FabricSimpleRisk/Core'
      ss.dependency 'ForterSDK', '~> 3.0.4'
      ss.ios.deployment_target = '12.0'
  end
  
  s.subspec 'RiskifiedBeacon' do |ss|
      ss.source_files = 'FabricSimpleRisk/Classes/RiskifiedBeacon/**/*'
      ss.dependency 'FabricSimpleRisk/Core'
      ss.dependency 'RiskifiedBeaconXCFramework', '~> 1.3.2'
      ss.ios.deployment_target = '11.0'

  end
  
  s.subspec 'TrustDecisionPro' do |ss|
      ss.source_files = 'FabricSimpleRisk/Classes/TrustDecisionPro/**/*'
      ss.dependency 'FabricSimpleRisk/Core'
      ss.dependency 'TrustDecisionPro', '~> 5.2.0'
      ss.ios.deployment_target = '9.0'
  end
  
end
