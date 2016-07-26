//
//  SCRetweetStatusView.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/24.
//
//

import UIKit
import SnapKit
class SCRetweetStatusView: UIView {

    var bottomCons : Constraint?
    
    
    var statusViewModel :SCStatusViewModel?{
        didSet{
            //            内容
            contentLabel.text = statusViewModel?.retweetText
            
            
//            卸载之前的底部约束
            bottomCons?.uninstall()

//            配图数据
         if  let pic_urls = statusViewModel?.status?.retweeted_status?.pic_urls where pic_urls.count > 0 {
            
//            赋值
            pictureView.pic_urls = pic_urls
            
            
//           根据配图视图设置数据（大小宽高）
            pictureView.snp_updateConstraints(closure: { (make) in
                make.size.equalTo(statusViewModel!.retweetPictureViewSize)
            })
//            将配图显示出来
            
            pictureView.hidden = false
            
//            以转发微博视图为例：转发微博视图的底部等于配图视图的底部
            self.snp_makeConstraints(closure: { (make) in
                 bottomCons = make.bottom.equalTo(pictureView).offset(SCStatusCellMargin).constraint
            })
            
         }else{
//            没有配图
//            隐藏控件
            pictureView.hidden = true
            self.snp_makeConstraints(closure: { (make) in
               bottomCons = make.bottom.equalTo(contentLabel).offset(SCStatusCellMargin).constraint
            })
            }
            
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI(){
    
        backgroundColor = UIColor (white: 242/255, alpha: 1)
        
        addSubview(contentLabel)
        addSubview(pictureView)
        
//        约束
        contentLabel.snp_makeConstraints { (make) in
            make.leading.top.equalTo(self).offset(SCStatusCellMargin)
        }
//        配图
        pictureView.snp_makeConstraints { (make) in
            make.leading.equalTo(contentLabel)
            make.top.equalTo(contentLabel.snp_bottom).offset(SCStatusCellMargin)
        }
        
        
        self.snp_makeConstraints { (make) in
            
           bottomCons = make.bottom.equalTo(pictureView.snp_bottom).offset(SCStatusCellMargin).constraint
        }
    }
    
//    懒加载
//    转发微博内容的lable
    private lazy var contentLabel : UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor.darkGrayColor()
        label.font = UIFont .systemFontOfSize(SCStatusCellContenFontSize)
        label.preferredMaxLayoutWidth = SCReenW - SCStatusCellMargin * 2
        label.numberOfLines = 0
        
        return label
    }()
    
//    配图视图
    private lazy var pictureView :SCStatusPictureView = SCStatusPictureView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
    
}
