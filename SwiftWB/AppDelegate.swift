//
//  AppDelegate.swift
//  SwiftWB
//
//  Created by WhenYouBelieve on 2019/11/5.
//  Copyright © 2019 WhenYouBelieve. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = BaseTabBarController()
        window?.makeKeyAndVisible()
        return true
    }
}

