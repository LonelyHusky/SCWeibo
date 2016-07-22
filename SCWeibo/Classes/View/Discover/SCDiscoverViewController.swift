//
//  SCDiscoverViewController.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/19.
//
//

import UIKit

class SCDiscoverViewController: SCVisitorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !isLogin {
            visitorView?.setupVisitorViewInfo("visitordiscover_image_message", title: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过")
            return
        }
//        登入之后才能显示搜索栏
        navigationItem.titleView = SCDiscoverSearchView()

    }
 
   
}

