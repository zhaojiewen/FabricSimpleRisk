import ForterSDK

extension FabricSimpleRisk {
    /// 启动FoterSDK
    /// - Parameter withSiteId: siteId
    @objc
    public static func startForterSDK(withSiteId: String) {
        ForterSDK.setup(withSiteId: withSiteId)
        addNotification()
    }
    
    @objc
    public static func getForterToken() -> String? {
        var error: NSError?
        let token = ForterSDK.getForterToken(&error)
        if let _ = error {
            return nil
        }
        return token
    }

    @objc
    private static func addNotification() {
        
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleAppDidBecomeActive),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
        
    }

    @objc
    private static func handleAppDidBecomeActive() {
        FTRSDKApplicationDelegate.sharedInstance().applicationDidBecomeActive(UIApplication.shared)
    }
    
    

}



