//
//  SCRetweetStatusView.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/24.
//
//

import UIKit

class SCRetweetStatusView: UIView {

    
    var statusViewModel :SCStatusViewModel?{
        didSet{
            
            
            //            内容
            contentLabel.text = statusViewModel?.retweetText
            
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
//        约束
        contentLabel.snp_makeConstraints { (make) in
            make.leading.top.equalTo(self).offset(SCStatusCellMargin)
        }
        
        self.snp_makeConstraints { (make) in
            make.bottom.equalTo(contentLabel.snp_bottom).offset(SCStatusCellMargin)
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
    
}
