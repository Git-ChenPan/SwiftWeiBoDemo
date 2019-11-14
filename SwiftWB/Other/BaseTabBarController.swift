//
//  BaseTabBarController.swift
//  SwiftWB
//
//  Created by WhenYouBelieve on 2019/11/5.
//  Copyright © 2019 WhenYouBelieve. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController , UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        //直接修改tabBar.tintColor等同于修改下面vc.tabBarItem.setTitleTextAttributes
        //tabBar.tintColor = UIColor.orange
        
        tabBar.backgroundImage = UIImage(named: "tabbar_background")
        buildViewControllers(vc: HomeTableViewController(), title:"首页", normalImg: "tabbar_home", highImg: "tabbar_home_highlighted")
        buildViewControllers(vc: MessageTableViewController(), title:"消息", normalImg: "tabbar_message_center", highImg: "tabbar_message_center_highlighted")
        buildViewControllers(vc: CenterTableViewController(), title:"", normalImg: "place", highImg: "place")
        buildViewControllers(vc: DiscoverTableViewController(), title:"发现", normalImg: "tabbar_discover", highImg: "tabbar_discover_highlighted")
        buildViewControllers(vc: ProfileTableViewController(), title:"我", normalImg: "tabbar_profile", highImg: "tabbar_profile_highlighted")
        
        tabBar.addSubview(addBtn)
        
    }
    
    private lazy var addBtn: UIButton = {
       let btn = UIButton()
        btn.frame = CGRect(x: 2*UIScreen.main.bounds.width/(CGFloat)(viewControllers?.count ?? 5), y: 0, width:UIScreen.main.bounds.width/(CGFloat)(viewControllers?.count ?? 5), height: 49)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: .normal)
        return btn
    }()
    
    func addBtnClick()  {
        print("点击了中间按钮")
    }

    private func buildViewControllers(vc:UIViewController, title:String, normalImg:String, highImg:String){
        vc.tabBarItem.image = UIImage(named: normalImg)
        vc.tabBarItem.selectedImage = UIImage(named: highImg)
        vc.title = title;
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:.normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for:.selected)
        let baseNav = BaseNavigationController()
        baseNav.addChild(vc)
        addChild(baseNav)
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.children[0] is CenterTableViewController{
            
            //点击中间按钮，自定义跳转自己的控制器
            addBtnClick()
            
            return false
        }
        return true
    }
}
