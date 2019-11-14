//
//  BaseWebViewController.swift
//  SwiftWB
//
//  Created by WhenYouBelieve on 2019/11/6.
//  Copyright © 2019 WhenYouBelieve. All rights reserved.
//

import UIKit

class BaseWebViewController: UIViewController , UIWebViewDelegate{

    var webView = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        webView.frame = CGRect.init(x: 0, y: 66, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 120)
        view.addSubview(webView)
        
//        因为URL没有默认构造器，所以不能使用URL()
        
//        初始化URL方案一
//        if let urls = URL(string: "http://www.baidu.com") {
//            let requests = URLRequest(url:urls)
//            webView.loadRequest((requests) as URLRequest)
//        }else{
//
//        }
        
        //初始化URL方案二
        guard let urls = URL(string: "http://www.baidu.com")
            else { return }
        let requests = URLRequest(url:urls)
        webView.loadRequest(requests)
        
    }
}

extension BaseWebViewController {
    func webViewDidStartLoad(_ webView: UIWebView) {
        print(webViewDidStartLoad)
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        print("开始加载")
        return true
    }
}
