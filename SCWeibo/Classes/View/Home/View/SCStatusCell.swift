//
//  SCStatusCell.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/23.
//
//

import UIKit
import SnapKit


//昵称文字大小
let SCtatusCellNameFontSize :CGFloat = 14
//头像大小
let SCStatusCellHeadImageWH :CGFloat = 35
//时间与来源
let SCStatusCellTimeFontSize : CGFloat = 10
//内容字体大小
let SCStatusCellContenFontSize : CGFloat = 14
//底部视图的高度
let SCStatusCellBottomViewH : CGFloat = 35

//间距
let SCStatusCellMargin : CGFloat = 10

class SCStatusCell: UITableViewCell {
//    toolBar的顶部约束
    var toolBarTopCons : Constraint?
    
    
    
    var statusViewModel : SCStatusViewModel?{
        didSet{
            originalView.statusViewModel = statusViewModel
            
            toolBarTopCons?.uninstall()
            
//            判断是否有转发weibo
            if statusViewModel?.status?.retweeted_status != nil {
//                设置数据
                retweetView.statusViewModel = statusViewModel
//                有转发微博
                retweetView.hidden = false
                toolBar.snp_updateConstraints(closure: { (make) in
                   toolBarTopCons = make.top.equalTo(retweetView.snp_bottom).constraint
                })
            }else{
//                没有转发微博
//                隐藏视图
                retweetView.hidden = true
                toolBar.snp_updateConstraints(closure: { (make) in
                   toolBarTopCons = make.top.equalTo(originalView.snp_bottom).constraint
                })
            }
        }
    
    }
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   private func setupUI(){
//    cell选中的样式
        selectionStyle = .None
        backgroundColor = UIColor (white: 242/255,alpha:1)
    
    //    添加控件
        contentView.addSubview(originalView)
        contentView.addSubview(toolBar)
        contentView.addSubview(retweetView)
    
    //    添加约束
        originalView.snp_makeConstraints { (make) in
            make.top.equalTo(contentView).offset(SCStatusCellMargin)
            make.trailing.leading.equalTo(contentView)
        }
        toolBar.snp_makeConstraints { (make) in
            toolBarTopCons = make.top.equalTo(retweetView.snp_bottom).constraint
            make.leading.trailing.equalTo(originalView)
            make.height.equalTo(SCStatusCellBottomViewH)
    }
    
        retweetView.snp_makeConstraints { (make) in
            make.leading.trailing.equalTo(originalView)
            make.top.equalTo(originalView.snp_bottom)
//            make.height.equalTo(60)
    }
    
        contentView.snp_makeConstraints { (make) in
            make.bottom.equalTo(self.toolBar.snp_bottom)
            make.top.leading.trailing.equalTo(self)
    }
    
    }
    
    private lazy var originalView:SCOriginalStatusView = SCOriginalStatusView()
      
    private lazy var toolBar: SCStatusToolBar = SCStatusToolBar()
    
    private lazy var retweetView :SCRetweetStatusView = SCRetweetStatusView()
}
    



