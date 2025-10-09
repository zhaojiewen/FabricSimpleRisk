import UIKit
import ForterSDK
import RiskifiedBeacon
import TDMobRisk

public typealias FabricGetTokenBlock = @convention(block) (String?) -> Void

// MARK: - 风控服务商
@objc public enum FabricSimpleRiskProviderOptions: Int {
    case forter        = 1
    case riskified     = 2
    case trustDecision = 4
}

public struct FabricSimpleRiskProvider: OptionSet {
    public let rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }

    public static let forter        = FabricSimpleRiskProvider(rawValue: 1 << 0)
    public static let riskified     = FabricSimpleRiskProvider(rawValue: 1 << 1)
    public static let trustDecision = FabricSimpleRiskProvider(rawValue: 1 << 2)
}

extension FabricSimpleRiskProvider {
    public init(_ objcValue: FabricSimpleRiskProviderOptions) {
        self.init(rawValue: objcValue.rawValue)
    }

    public var objcValue: FabricSimpleRiskProviderOptions {
        return FabricSimpleRiskProviderOptions(rawValue: rawValue) ?? .forter
    }
}

// MARK: - SDK 主类
@objc public class FabricSimpleRisk: NSObject {
    
    /// 主入口，启动第三方SDK
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
            FabricSimpleRisk.startForterSDK(withSiteId: forterSiteId)
        }
        
        if providers.contains(.riskified) {
            debugPrint("启动 Riskified SDK")
            FabricSimpleRisk.startRiskifiedBeacon(shopName: riskifiedShopName,
                                                  sessionToken: riskifiedSessionToken)
        }
        
        if providers.contains(.trustDecision) {
            debugPrint("启动 TrustDecision SDK")
            FabricSimpleRisk.startTD(config: tdConfig)
        }
    }

    
    /// 主入口，启动第三方SDK
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
