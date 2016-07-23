//
//  SCWeiIconViewController.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/23.
//
//

import UIKit
import SDWebImage
class SCWeiIconViewController: UIViewController {
   
    override func loadView() {
        view = bgImageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        setupUi()
        
    }

    private func setupUi(){
        
//        添加控件
        view.addSubview(headImage)
        view.addSubview(messageLabel)
//    添加约束
        headImage.snp_makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 90,height: 90))
            make.centerX.equalTo(view)
            make.top.equalTo(400)
        }
        messageLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(headImage)
            make.top.equalTo(headImage.snp_bottom).offset(15)
        }
        
    }
//    在什么时候去执行（应该写在控制器里面的那个地方）界面展示出来才去执行动画
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
//        更新约束
        headImage.snp_updateConstraints { (make) in
            make.top.equalTo(100)
        }
        /*
         1.持续时间
         2.延迟多少秒后执行
         3.阻尼  0－1 值越小。幅度越大
         4.初始化速度
         5.动画的选项
         6.动画执行后调用的闭包
         */
        UIView.animateWithDuration(2, delay: 0,usingSpringWithDamping: 0.7,initialSpringVelocity: 0,options: [],animations: {() -> Void in
            
            self.view.layoutIfNeeded()
            
        }){(_) -> Void in
            UIView.animateWithDuration(1, animations: { 
                self.messageLabel.alpha = 1
                }, completion: { (_) -> Void in
//                    动画完毕，关闭当前控制器，切换根控制器
//                    let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
//                    appDelegate?.window?.rootViewController = SCMainViewController()
                    NSNotificationCenter.defaultCenter().postNotificationName(SCChangeRootVCNotification, object: nil)
            
            })
        }
    }
    
    
    
//懒加载控件
    private lazy var bgImageView: UIImageView = {
        
        let bgImageView = UIImageView(image: UIImage(named:"ad_background"))
        return bgImageView
    }()
    
   private lazy var headImage:UIImageView = {
    
        let headImage = UIImageView(image: UIImage(named: "avatar_default_big"))
        headImage.layer.borderWidth = 2
        headImage.layer.borderColor = UIColor .orangeColor().CGColor
        headImage.layer.cornerRadius = 45
    
    if let avatarImage = SCUserAccountModel.sharedMOdel.account?.avatar_large{
        headImage.sd_setImageWithURL(NSURL(string:avatarImage), placeholderImage: UIImage(named:"avatar_default_big"))
    }
        headImage.layer.masksToBounds = true
        return headImage
    
    }()
    
    private lazy var messageLabel:UILabel = {

        let messageLabel = UILabel()
        messageLabel.textColor = UIColor .grayColor()
        messageLabel.text = "欢迎回来"
        messageLabel.font = UIFont.systemFontOfSize(14)
        messageLabel.alpha = 0
        return messageLabel
        
    }()
    
    
    
}
