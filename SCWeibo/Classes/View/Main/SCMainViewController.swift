//
//  SCMainViewController.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/19.
//
//

import UIKit

class SCMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(SCHomeViewController(), imgeNamed: "tabbar_home", title: "首页")
        addChildViewController(SCDiscoverViewController(), imgeNamed: "tabbar_discover", title: "发现")
        addChildViewController(SCMessageViewController(), imgeNamed: "tabbar_message_center", title: "消息")
        addChildViewController(SCProfileViewController(), imgeNamed: "tabbar_profile", title: "我")

      
        
    }
    
    
    /*
    */
    private func addChildViewController(childController: UIViewController,imgeNamed:String,title : String) {
        
        self.tabBar.tintColor = UIColor.orangeColor()
//     设置标题
        childController.title = title
//        设置图片
        childController.tabBarItem.selectedImage = UIImage(named: "\(imgeNamed)_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        childController.tabBarItem.image = UIImage(named: imgeNamed)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        
        
        addChildViewController(UINavigationController(rootViewController: childController))
        
    }
    
}














 



























