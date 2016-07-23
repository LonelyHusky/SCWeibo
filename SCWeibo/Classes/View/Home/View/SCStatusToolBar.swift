//
//  SCStatusToolBar.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/24.
//
//

import UIKit

class SCStatusToolBar: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI(){
//    添加控件
        
       let retweetButton = addChildButton("转发", imgName: "timeline_icon_retweet")
       let commentButton = addChildButton("评论", imgName: "timeline_icon_comment")
       let likeButton = addChildButton("赞", imgName: "timeline_icon_unlike")
       let sp1 = UIImageView(image: UIImage(named: "timeline_card_bottom_line"))
       let sp2 = UIImageView(image: UIImage(named: "timeline_card_bottom_line"))
        addSubview(sp1);addSubview(sp2)

    //  添加约束
        retweetButton.snp_makeConstraints { (make) in
            make.leading.top.bottom.equalTo(self)
            make.width.equalTo(commentButton)
        }
        commentButton.snp_makeConstraints { (make) in
            make.leading.equalTo(retweetButton.snp_trailing)
            make.top.bottom.equalTo(self)
            make.width.equalTo(likeButton)

        }
        likeButton.snp_makeConstraints { (make) in
            make.trailing.top.bottom.equalTo(self)
            make.leading.equalTo(commentButton.snp_trailing)
            make.width.equalTo(retweetButton )
        }
        sp1.snp_makeConstraints { (make) in
           make.centerX.equalTo(retweetButton.snp_trailing)
           make.centerY.equalTo(self)
        }
        sp2.snp_makeConstraints { (make) in
            make.centerX.equalTo(commentButton.snp_trailing)
            make.centerY.equalTo(self)
        }
    }

    private func  addChildButton(title: String ,imgName: String) -> UIButton{
    
        let button = UIButton()
        button.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        button.setTitle(title, forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "timeline_card_bottom_background"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "timeline_card_bottom_background_highlighted"), forState: UIControlState.Highlighted)
        button.setImage(UIImage(named:imgName), forState: UIControlState.Normal)
        
        addSubview(button)
        return button
    }
    
}
