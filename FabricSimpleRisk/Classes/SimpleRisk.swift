import UIKit
import ForterSDK
import RiskifiedBeacon
import TDMobRisk

public typealias FabricGetTokenBlock = @convention(block) (String?) -> Void

// MARK: - 风控服务商
@objc public enum FabricSimpleRiskProviderOptions: Int {
    /// Forter  https://docs.forter.com/mobile-sdks
    case forter        = 1
    /// Riskified https://apiref.riskified.com/#beacon
    case riskified     = 2
    /// 同盾 https://cn-doc.trustdecision.com/reference/ios-global
    case trustDecision = 4
}

public struct FabricSimpleRiskProvider: OptionSet {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }

    public static let forter        = FabricSimpleRiskProvider(rawValue: 1 << 0)
    public static let riskified     = FabricSimpleRiskProvider(rawValue: 1 << 1)
    public static let trustDecision = FabricSimpleRiskProvider(rawValue: 1 << 2)
}


// MARK: - SDK 主类
@objc public class SimpleRisk: NSObject {
    
    /// Swift-主入口，启动第三方SDK。
    /// 如果包含同盾（TrustDecision）请确保在用户同意隐私协议后调用。
    /// - Parameters:
    ///   - providers: 风控SDK集成来源 FabricSimpleRiskProvider
    ///   - forterSiteId: The Forter site id from the Forter Portal
    ///   - riskifiedShopName: The Riskified account name (shop.com)
    ///   - riskifiedSessionToken: unique identifier that is generated for the user’s
    ///    current browsing session. The same identifier should be passed by the
    ///    backend as the cart_token in applicable API requests to Riskified
    ///   - tdConfig: 同盾配置
    public static func start(providers: FabricSimpleRiskProvider,
                             forterSiteId: String = "",
                             riskifiedShopName: String = "",
                             riskifiedSessionToken: String = "",
                             tdConfig: FabricTDConfig = FabricTDConfig()) {
        if providers.contains(.forter) {
            debugPrint("启动 Forter SDK")
            SimpleRisk.startForterSDK(withSiteId: forterSiteId)
        }
        
        if providers.contains(.riskified) {
            debugPrint("启动 Riskified SDK")
            SimpleRisk.startRiskifiedBeacon(shopName: riskifiedShopName,
                                                  sessionToken: riskifiedSessionToken)
        }
        
        if providers.contains(.trustDecision) {
            debugPrint("启动 TrustDecision SDK")
            SimpleRisk.startTD(config: tdConfig)
        }
    }

    
    /// OC-主入口，启动第三方SDK
    /// 如果包含同盾（TrustDecision）请确保在用户同意隐私协议后调用。
    /// - Parameters:
    ///   - options: 风控SDK集成来源 FabricSimpleRiskProvider
    ///   - forterSiteId: The Forter site id from the Forter Portal
    ///   - riskifiedShopName: The Riskified account name (shop.com)
    ///   - riskifiedSessionToken: unique identifier that is generated for the user’s
    ///    current browsing session. The same identifier should be passed by the
    ///    backend as the cart_token in applicable API requests to Riskified
    ///   - tdConfig: 同盾配置
    @objc
    public static func startWithOptions(_ options: Int,
                                        forterSiteId: String = "",
                                        riskifiedShopName: String = "",
                                        riskifiedSessionToken: String = "",
                                        tdConfig: FabricTDConfig) {
        let providers = FabricSimpleRiskProvider(rawValue: options)
        start(providers: providers,
              forterSiteId: forterSiteId,
              riskifiedShopName: riskifiedShopName,
              riskifiedSessionToken: riskifiedSessionToken,
              tdConfig: tdConfig)
    }
    
}
