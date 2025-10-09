//
//  AppDelegate.swift
//  LibSimpleRisk
//
//  Created by 9152264 on 09/29/2025.
//  Copyright (c) 2025 9152264. All rights reserved.
//

import UIKit
import FabricSimpleRisk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configSimpleRisk()
        /// 或者单独调用某一个SDK
        //configRisk()
        return true
    }
    
    
    /// 单独调用每个SDK
    func configRisk() {
        FabricSimpleRisk.startForterSDK(withSiteId: "")
//        FabricSimpleRisk.startRiskifiedBeacon(shopName: "", sessionToken: "")
//        FabricSimpleRisk.startTD(isPrivacyAgree: true, partner: "", appKey: "", country: "")
//        FabricSimpleRisk.startTD(options: [:])
    }
    
    /// 统一入口，调用多个SDK
    func configSimpleRisk() {
        FabricSimpleRisk.start(providers: [.forter, .riskified, .trustDecision],
                               forterSiteId: "cc4b7359b1d7",
                               riskifiedShopName: "",
                               riskifiedSessionToken: "",
                               tdConfig: FabricTDConfig(isPrivacyAgree: true,
                                                        partner: "lycom",
                                                        appKey: "773085f8d89718d00bde643c7b2fbc1f",
                                                        country: "cn"))
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

