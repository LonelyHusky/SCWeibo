//
//  SCVisitorView.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/20.
//
//

import UIKit
import SnapKit
class SCVisitorView: UIView {
    // 声明一个闭包
    var closure:(()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 监听方法
    @objc private func loginButtonClick(){
        closure?()
    }
    
    // MARK: - 供外界调用
    func setupVisitorViewInfo(imgName: String?, title: String?){
        // 判断imgName 和title是否为nil
        // 如果不为nil  代表设置的为 消息 发现 我
        if let img = imgName, let tit = title {
            iconImageView.image = UIImage(named: img)
            messageLabel.text = tit
            feedImageView.hidden = true
            
        }else {
            // 代表首页
            setupAnim()
        }
    }

    // 设置圆圈动画
    func setupAnim(){
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        // 设置toValue
        anim.toValue = M_PI * 2
        // 设置时间
        anim.duration = 10
        // 设置重复次数
        anim.repeatCount = MAXFLOAT
        // 当切换控制器或者程序退到后台 默认动画会停止
        anim.removedOnCompletion = false
        // 添加动画
        feedImageView.layer.addAnimation(anim, forKey: nil)
    }
    
    // MARK: - 设置视图
    func setupUI(){
        backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        // 01 添加控件
        addSubview(feedImageView)
        addSubview(maskImageView)
        addSubview(iconImageView)
        addSubview(messageLabel)
        addSubview(loginButton)
        addSubview(regButton)
        // 02 添加约束
        // 01
        feedImageView.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self)
        }
        // 02
        maskImageView.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self)
        }
        // 03
        iconImageView.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self)
        }
        // 04
        messageLabel.snp_makeConstraints { (make) -> Void in
            //            make.width.equalTo(230)
            //            make.height.equalTo(36)
            make.size.equalTo(CGSize(width: 230, height: 36))
            make.top.equalTo(maskImageView.snp_bottom).offset(16)
            make.centerX.equalTo(self)
        }
        // 05
        loginButton.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 100, height: 36))
            make.top.equalTo(messageLabel.snp_bottom).offset(16)
            make.leading.equalTo(messageLabel)
        }
        // 06
        regButton.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(loginButton)
            make.top.equalTo(loginButton)
            make.trailing.equalTo(messageLabel)
        }
        
        
    }
    
    
    // MARK: - 懒加载控件
    // 圆圈
    private lazy var feedImageView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    // 遮挡
    private lazy var maskImageView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    // 房子
    private lazy var iconImageView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    // 文字
    private lazy var messageLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFontOfSize(14)
        lab.text = "关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜"
        lab.numberOfLines = 0
        lab.textAlignment = .Center
        lab.textColor = UIColor.grayColor()
        return lab
    }()
    // 登录
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        // 添加点击时间
        button.addTarget(self, action: #selector(SCVisitorView.loginButtonClick), forControlEvents: UIControlEvents.TouchUpInside)
        button.setTitle("登录", forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(14)
        button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        return button
    }()
    
    // 注册
    private lazy var regButton: UIButton = {
        let button = UIButton()
        
        // 添加点击时间
        button.addTarget(self, action: #selector(SCVisitorView.loginButtonClick), forControlEvents: UIControlEvents.TouchUpInside)
        button.setTitle("注册", forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(14)
        button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        return button
    }()
}
  

extension SCVisitorView {
    func demo() {
        feedImageView.translatesAutoresizingMaskIntoConstraints = false
        /// 约束
        ///
        /// @param feedImageView             约束的对象
        /// @param NSLayoutAttribute.CenterX 条件
        /// @param NSLayoutRelation.Equal    等于
        /// @param self                      相对于谁约束
        /// @param NSLayoutAttribute.CenterX 条件
        /// @param 1                         倍数
        /// @param 0                         浮点数
        ///
        /// @return
        addConstraint(NSLayoutConstraint(item: feedImageView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: feedImageView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
    }
}













  