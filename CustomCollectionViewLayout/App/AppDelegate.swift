//
//  AppDelegate.swift
//  CustomCollectionViewLayout
//
//  Created by Nazmul Islam on 2/4/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let rootVC = AppFactory.shared.vcFactory.getAppRootVC()

        let window = UIWindow()
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
        self.window = window

        return true
    }
}

