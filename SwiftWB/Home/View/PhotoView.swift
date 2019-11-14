//
//  PhotoView.swift
//  SwiftWB
//
//  Created by WhenYouBelieve on 2019/11/12.
//  Copyright © 2019 WhenYouBelieve. All rights reserved.
//

import UIKit

class PhotoView: UIView {

//    private var _photoArr:NSArray?
//    var photoArr: NSArray {
//        set{
//            _photoArr = newValue
//        }
//        get{
//            _photoArr ?? NSArray()
//        }
//    }
    
    var photoArr =  NSArray(){
        didSet{
            var index:Int = 0
             for item in photoArr {
                 //行
                 let row = index / 3
                 //列
                 let col = index % 3
                 let iv: UIImageView = UIImageView()
                 iv.tag = index
                 let urlS:String = (item as? StatusSourcePhotoModel ?? StatusSourcePhotoModel()).thumbnail_pic
                 let bigImageUrl = urlS.replacingOccurrences(of: "thumbnail", with: "bmiddle")
                 iv.sd_setImage(with: URL(string: bigImageUrl)) { (_, _, _, _) in }
                 addSubview(iv)
                 let imgWidth = (UIScreen.main.bounds.size.width - 20 - 16*2 - 5*2)/3
                 let ImgX = CGFloat(5 * col + col * Int(imgWidth))
                 let ImgY = CGFloat(5 + 5 * row + row * Int(imgWidth))
                 iv.frame = CGRect(x: ImgX, y: ImgY, width:CGFloat(imgWidth), height:CGFloat(imgWidth))
                 index = index + 1
                 //添加点击手势
                 let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction(action:)))
                 iv.isUserInteractionEnabled = true
                 iv.addGestureRecognizer(tap)
            }
        }
    }

    @objc func tapAction(action: UITapGestureRecognizer) {
        let tag = action.view?.tag ?? 0
        if let vi:UIViewController = UIViewController.current()  {
            let photoV = PhotoViewController()
            let urlS:String = (photoArr[tag] as? StatusSourcePhotoModel ?? StatusSourcePhotoModel()).thumbnail_pic
            photoV.photoUrl = urlS
            photoV.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            vi.present(photoV, animated: true) {
                
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 254/255.0, green: 254/255.0, blue: 254/255.0, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
