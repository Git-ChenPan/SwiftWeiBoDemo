//
//  UIView+Catagory.swift
//  SwiftWB
//
//  Created by WhenYouBelieve on 2019/11/13.
//  Copyright © 2019 WhenYouBelieve. All rights reserved.
//

import Foundation

extension UIViewController {
    class func current(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return current(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return current(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return current(base: presented)
        }
        return base
    }
}
