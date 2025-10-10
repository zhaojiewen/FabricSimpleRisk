import RiskifiedBeacon

extension SimpleRisk {
    /// RiskifiedBeacon
    /// - Parameters:
    ///   - shopName: The name of your Riskified account
    ///   - sessionToken: unique identifier that is generated for the user’s
    ///    current browsing session. The same identifier should be passed by the
    ///    backend as the cart_token in applicable API requests to Riskified
    ///   - debug: log debug info, default false
    @objc
    public static func startRiskifiedBeacon(shopName: String,
                                            sessionToken: String,
                                            debug: Bool = false
    ) {
        RiskifiedBeacon.start(shopName, sessionToken: sessionToken, debugInfo: debug)
    }
    
    
    /// When the user’s session changes, update the token
    /// - Parameter sessionToken: new Token
    @objc
    public static func update(sessionToken: String) {
        RiskifiedBeacon.updateSessionToken(sessionToken)
    }
    
    /// Manually log a request to a specific URL.
    /// For each relevant HTTP request, i.e., non-image
    /// requests, notify the beacon by calling
    /// - Parameter request: The remote url that the host app sent a request to
    @objc
    public static func log(request: URL) {
        RiskifiedBeacon.logRequest(request)
    }
}



