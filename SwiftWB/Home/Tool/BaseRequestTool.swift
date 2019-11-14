//
//  BaseRequestTool.swift
//  SwiftWB
//
//  Created by WhenYouBelieve on 2019/11/6.
//  Copyright © 2019 WhenYouBelieve. All rights reserved.
//

import UIKit

class BaseRequestTool: NSObject {
    
    static let shared = BaseRequestTool()
    
    typealias requestBlock = (Any) -> Void

    static func getReuqestWithUrl(url:String,dic:[String:String], codeBlock: @escaping requestBlock) {
        let afnSessionManger = AFHTTPSessionManager()
        afnSessionManger.get(url, parameters: dic, progress: { (_) in
            
        }, success: { (_, Json) in
            print(Json ?? "")
            codeBlock(Json ?? 0)
        }) { (_, error) in
            print(error)
            codeBlock(0)
        }
    }
    
    static func postReuqestWithUrl(url:String,dic:[String:String],codeBlock:requestBlock) {
        let afnSessionManger = AFHTTPSessionManager()
        afnSessionManger.post(url, parameters: dic, progress: { (_) in
            
        }, success: { (_, Json) in
           
        }) { (_, error) in
            print(error)
        }
    }
}
