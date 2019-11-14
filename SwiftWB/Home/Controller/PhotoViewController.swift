//
//  PhotoViewController.swift
//  SwiftWB
//
//  Created by WhenYouBelieve on 2019/11/13.
//  Copyright © 2019 WhenYouBelieve. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var photoUrl: String = "" {
        didSet {
           let bigImageUrl = photoUrl.replacingOccurrences(of: "thumbnail", with: "bmiddle")
            imgV.sd_setImage(with: URL(string: bigImageUrl)) { (_, _, _, _) in }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imgV)
    imgV.sd.centerXEqual(view).centerYEqual(view).widthIs(UIScreen.main.bounds.size.width).heightIs(UIScreen.main.bounds.size.width)
        //添加点击手势
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        imgV.isUserInteractionEnabled = true
        imgV.addGestureRecognizer(tap)
        
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    lazy var imgV: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    
    @objc func tapAction() {
//        dismiss(animated: false) {
//
//        }
        dismiss(animated: false, completion: nil)
    }

}
