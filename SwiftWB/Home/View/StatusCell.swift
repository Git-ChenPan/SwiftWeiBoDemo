//
//  StatusCell.swift
//  SwiftWB
//
//  Created by WhenYouBelieve on 2019/11/11.
//  Copyright © 2019 WhenYouBelieve. All rights reserved.
//

import UIKit

class StatusCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLb)
        contentView.addSubview(timeLb)
        contentView.addSubview(sourceLb)
        contentView.addSubview(detailLb)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    //计算属性生成方式一
//    public var _sourceModel: StatusSourceModel?
//    public var sourceModel: StatusSourceModel{
//        set{
//            _sourceModel = newValue
//            setUpFrame()
//            setSourceData()
//        }
//        get{
//            _sourceModel ?? StatusSourceModel()
//        }
//    }
    
    //计算属性生成方式二
    public var sourceModel = StatusSourceModel(){
        didSet{
            setUpFrame()
            setSourceData()
        }
    }
    
    func setUpFrame(){
        iconImageView.sd.leftSpace(contentView, 16).topSpace(contentView, 16).widthIs(45).heightIs(45)
        nameLb.sd.leftSpace(iconImageView, 5).topEqual(iconImageView).rightSpace(contentView, 16).heightIs(21)
        timeLb.sd.leftSpace(iconImageView, 5).minWidthIs(50).heightIs(20).topSpace(nameLb, 5)
        sourceLb.sd.leftSpace(timeLb, 5).rightSpace(contentView, 16).heightIs(20).topSpace(nameLb, 5)
        detailLb.sd.leftSpace(contentView, 16).topSpace(iconImageView, 5).rightSpace(contentView, 16).autoHeight(0)
        detailLb.layoutIfNeeded()
        if sourceModel.pic_urls.count > 0 {
            contentView.addSubview(photoVi)
            let imgWidth: CGFloat = (UIScreen.main.bounds.size.width - 20 - 16*2 - 5*2)/3
            let pic_urlsCount = sourceModel.pic_urls.count - 1
            let row = pic_urlsCount / 3
            let margin = CGFloat(row * 5)
            let imgWidthCount = CGFloat(Int(row) * Int(imgWidth))
            let photoViHight: CGFloat =  margin + imgWidthCount + imgWidth + 5
            photoVi.sd.topSpace(detailLb, 5).leftSpace(contentView, 16).rightSpace(contentView, 16).heightIs(photoViHight + 5)
            self.setNeedsLayout()
            photoVi.photoArr = sourceModel.pic_urls as NSArray? ?? NSArray()
            setupAutoHeight(withBottomView: detailLb, bottomMargin: 5 + photoViHight + 5 + 16 )
        }else {
            photoVi.removeFromSuperview()
            setupAutoHeight(withBottomView: detailLb, bottomMargin: 16)
        }
    }
    
    func setSourceData(){
        iconImageView.sd_setImage(with: URL.init(string: sourceModel.user.avatar_hd )) { (_, _, _, _) in
            
        }
        nameLb.text = sourceModel.user.screen_name
        timeLb.text = sourceModel.created_at
        
        let sourceText = sourceModel.source
        let startRang = sourceText.range(of: ">")!
        let endRang = sourceText.range(of: "</")!
        //Range中包含两个属性lowerBound（下界）upperBound （上界）
        sourceLb.text = "来自:" + sourceText[startRang.upperBound..<endRang.lowerBound]
        detailLb.text = sourceModel.text
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override var frame: CGRect {
        set{
            var newFrame = newValue
            newFrame.origin.x += 10
            newFrame.size.width -= 10*2
            newFrame.origin.y += 10
            newFrame.size.height -= 10
            super.frame = newFrame
        }
        get{
            return super.frame
        }
    }
    
    lazy var iconImageView: UIImageView = {
        let vi = UIImageView()
        vi.layer.cornerRadius = 22.5
        vi.layer.masksToBounds = true
        return vi
    }()
    
    lazy var nameLb: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.red
        lb.font = UIFont.systemFont(ofSize: 15.0)
        return lb
    }()
    
    lazy var timeLb: UILabel = {
           let lb = UILabel()
           lb.font = UIFont.systemFont(ofSize: 13.0)
           lb.textColor = UIColor.gray
           return lb
    }()
    
    lazy var sourceLb: UILabel = {
           let lb = UILabel()
           lb.font = UIFont.systemFont(ofSize: 13.0)
           lb.textColor = UIColor.gray
           return lb
    }()
    
    lazy var detailLb: UILabel = {
           let lb = UILabel()
           lb.font = UIFont.systemFont(ofSize: 16.0)
           lb.textColor = UIColor.black
           lb.backgroundColor = UIColor.white
           lb.numberOfLines = 0
           return lb
    }()
    
    lazy var photoVi:PhotoView = {
        let po = PhotoView()
        return po
    }()

}
