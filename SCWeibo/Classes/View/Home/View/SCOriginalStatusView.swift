//
//  SCOriginalStatusView.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/23.
//
//

import UIKit

class SCOriginalStatusView: UIView {
    
    var statusViewModel :SCStatusViewModel?{
        didSet{
//            设置头像
           headImage.sd_setImageWithURL(NSURL(string: statusViewModel?.status?.user?.profile_image_url ?? ""), placeholderImage:UIImage(named: "avatar_default_small"))
//            设置昵称
            nameLabel.text = statusViewModel?.status?.user?.name
//           
            memberIamgeView.image = statusViewModel?.memberIamge
            
//            时间与来源
            timeLabel.text = statusViewModel?.status?.created_at
            sourceLabel.text = statusViewModel?.sourcrText
            
//            内容
            contentLabel.text = statusViewModel?.status?.text
            
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
        
        backgroundColor = UIColor .whiteColor()

//        添加控件
        addSubview(headImage)
        addSubview(nameLabel)
        addSubview(memberIamgeView)
        addSubview(timeLabel)
        addSubview(sourceLabel)
        addSubview(verifiedImageView)
        addSubview(contentLabel)
        
//        添加约束
//        头像
        headImage.snp_makeConstraints { (make) in
            make.top.leading.equalTo(SCStatusCellMargin)
            make.size.equalTo(CGSize(width: SCStatusCellHeadImageWH, height: SCStatusCellHeadImageWH))
        }
//        昵称
        nameLabel.snp_makeConstraints { (make) in
            make.top.equalTo(headImage)
            make.leading.equalTo(headImage.snp_trailing).offset(SCStatusCellMargin)
        }
//        会员
        memberIamgeView.snp_makeConstraints { (make) in
            make.centerY.equalTo(nameLabel)
            make.leading.equalTo(nameLabel.snp_trailing).offset(SCStatusCellMargin)
            
        }
//        时间
        timeLabel.snp_makeConstraints { (make) in
            make.bottom.equalTo(headImage)
            make.leading.equalTo(nameLabel)
        }
//        来源
        sourceLabel.snp_makeConstraints { (make) in
            make.leading.equalTo(timeLabel.snp_trailing).offset(SCStatusCellMargin)
            make.top.equalTo(timeLabel)
        }
//        认证
        verifiedImageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(headImage.snp_trailing)
            make.centerY.equalTo(headImage.snp_bottom)

        }
//        内容
        contentLabel.snp_makeConstraints { (make) in
            make.leading.equalTo(headImage)
            make.top.equalTo(headImage.snp_bottom).offset(SCStatusCellMargin)
        }
        
        self.snp_makeConstraints { (make) in
            make.bottom.equalTo(contentLabel.snp_bottom).offset(SCStatusCellMargin)
        }

    }
    
    
    
//    懒加载
//    头像
    private lazy var headImage : UIImageView = UIImageView(image: UIImage(named: "avatar_default_small"))
//    昵称
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGrayColor()
        label.font = UIFont.systemFontOfSize(SCtatusCellNameFontSize)
        label.text = "呵呵"
        return label
    }()
//    会员图标
    private lazy var memberIamgeView : UIImageView = UIImageView(image: UIImage(named: "common_icon_membership"))
//    时间
    private lazy var timeLabel : UILabel = {
        let lable = UILabel()
        lable.textColor = UIColor.orangeColor()
        lable.font = UIFont.systemFontOfSize(SCStatusCellTimeFontSize)
        lable.text = "刚刚"
        return lable
    }()
    private lazy var sourceLabel : UILabel = {
        let lable = UILabel()
        lable.textColor = UIColor.orangeColor()
        lable.font = UIFont.systemFontOfSize(SCStatusCellTimeFontSize)
        lable.text = "来着  微博"
        return lable
    }()
//    认证
    private lazy var verifiedImageView : UIImageView = UIImageView(image: UIImage(named:"avatar_vip"))

//    
    private lazy var contentLabel : UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor.darkGrayColor()
        label.font = UIFont .systemFontOfSize(SCStatusCellContenFontSize)
        label.preferredMaxLayoutWidth = SCReenW - SCStatusCellMargin * 2
        label.numberOfLines = 0
        
        return label
    }()
}












 