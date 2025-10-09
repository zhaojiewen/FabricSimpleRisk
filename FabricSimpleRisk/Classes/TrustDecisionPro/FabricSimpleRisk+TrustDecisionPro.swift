///集成要求
///合规说明
///请注意，在贵司的App中集成同盾提供的SDK产品时:
///
///1.1 根据《网络安全法》《电信条例》《电信和互联网用户个人信息保护规定》等相关法律法规要求及监管实践中的标准，在贵司的最终用户首次启动App并在贵司开始采集信息之前，贵司应以交互界面或设计（如隐私政策弹窗等）向最终用户完整告知收集、使用、与第三方共享最终用户个人信息的目的、方式和范围，并征得最终用户的明示同意。
///
///1.2 为向贵司提供业务安全和风控服务，同盾SDK将采集、处理、使用用户的手机终端唯一标志信息IDFA、Android ID、OAID、GAID、MAC 地址、无线IP地址、WIFI列表、无线路由器标识（BSSID、SSID）、设备类型、设备型号、系统类型、位置信息（粗略位置信息、精准位置信息）、登录 IP 地址等设备信息。为确保贵司使用相关服务的合规性，前述隐私政策应涵盖对同盾SDK提供服务并采集、处理、使用相关信息的授权，以下条款内容供贵司参考，具体表述可由贵司根据贵司隐私协议的整体框架和内容自行确定：
///
///同盾SDK：为了业务安全和风控，我司使用了同盾 SDK，该 SDK 需要获取您的手机终端设备标识 IDFA、Android ID、OAID、GAID、MAC 地址、无线IP地址、WIFI列表、无线路由器标识（BSSID、SSID）、设备类型、设备型号、系统类型、位置信息（粗略位置信息、精准位置信息）、登录 IP 地址、应用程序列表、运行中进程信息、网络制式、设备软件版本号、传感器（光传感器、重力传感器、磁场传感器、加速度传感器、陀螺仪传感器、心率传感器）相关设备信息，用于设备欺诈风险识别。
///
///同盾隐私协议：https://www.tongdun.cn/other/privacy/id=1


///隐私文件配置
///参考https://cn-doc.trustdecision.com/reference/ios-global

import TDMobRisk

extension FabricSimpleRisk {
    
    
    /// 初始化：确保在用户同意隐私协议后，再进行SDK初始化,  否则无效。
    /// - Parameter config: 同盾配置
    public static func startTD(config: FabricTDConfig) {
        startTD(isPrivacyAgree: config.isPrivacyAgree,
                partner: config.partner,
                appKey: config.appKey,
                country: config.country)
    }
    
    /// 初始化：确保在用户同意隐私协议后，再进行SDK初始化,  否则无效。
    @objc
    public static func startTD(isPrivacyAgree: Bool,
                               partner: String,
                               appKey: String,
                               country: String) {
        guard isPrivacyAgree else { return }
        let options = [
            "partner": partner,
            "appKey": appKey,
            "country": country
        ]
        startTD(options: options)
    }
    
    
    /// 初始化：确保在用户同意隐私协议后，再进行SDK初始化,  否则在中国大陆不合规，详情请看上面合规说明。
    @objc
    public static func startTD(options: [AnyHashable: Any]) {
        guard let manager = TDMobRiskManager.sharedManager() else { return }
        manager.pointee.initWithOptions(options)
    }
    
    @objc
    public static func getBlackBox(block: @escaping FabricGetTokenBlock) {
        guard let manager = TDMobRiskManager.sharedManager() else { return }
        manager.pointee.getBlackBoxAsync(block)
    }
    
}


@objc
public class FabricTDConfig: NSObject {
    /// 是否同意隐私协议，在中国大陆合规要求在，只有同意了隐私协议才能进行初始化
    @objc
    public var isPrivacyAgree: Bool
    
    /// 合作方编码，请联系我司运营或者从客户平台获取
    @objc
    public var partner: String
    
    /// 应用标识，通过客户平台创建，参考 https://cn-doc.trustdecision.com/reference/ios-%E8%8E%B7%E5%8F%96-appkey
    @objc
    public var appKey: String
    
    /// 数据中心地区参数：
    /// cn代表中国
    /// us代表美国
    /// sg代表新加坡
    /// fra代表德国
    /// idna代表印尼
    @objc
    public var country: String
    
    @objc
    public init(isPrivacyAgree: Bool = false,
                partner: String = "",
                appKey: String = "",
                country: String = "cn") {
        self.isPrivacyAgree = isPrivacyAgree
        self.partner = partner
        self.appKey = appKey
        self.country = country
    }
}
