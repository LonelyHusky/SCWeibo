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
        
        let tabBar = SCTabBar()
        tabBar.shDelegate = self
        
        tabBar.closure = {
            print("按钮点击啦")
        }
        setValue(tabBar, forKey: "tabBar")
      
        addChildViewController(SCHomeViewController(), imgeNamed: "tabbar_home", title: "首页")
        addChildViewController(SCDiscoverViewController(), imgeNamed: "tabbar_discover", title: "发现")
        addChildViewController(SCMessageViewController(), imgeNamed: "tabbar_message_center", title: "消息")
        addChildViewController(SCProfileViewController(), imgeNamed: "tabbar_profile", title: "我")

      
    
        
    }
    
    
    /*
     
    */
     func addChildViewController(childController: UIViewController,imgeNamed:String,title : String) {
        
        self.tabBar.tintColor = UIColor.orangeColor()
//     同时设置tabBar和导航栏标题
        childController.title = title
//        设置图片
        childController.tabBarItem.selectedImage = UIImage(named: "\(imgeNamed)_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        childController.tabBarItem.image = UIImage(named: imgeNamed)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        addChildViewController(UINavigationController(rootViewController: childController))
        
    }
    
}
// MARK: - SHTabBarDelegate
extension SCMainViewController: SCTabBarDelegate {
    func composeButtonClick() {
        print("撰写按钮点击了")
    }
}










 



























