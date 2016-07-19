//
//  Extension+UIBarButtonItem.swift
//  SHWeibo3
//
//  Created by teacher on 16/7/19.
//  Copyright © 2016年 teacher. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    // 便利构造函数
    convenience init(title: String? = nil, imgName: String? = nil, target: AnyObject?, action: Selector) {
        self.init()
        // 创建一个button
        let button = UIButton()
        // 判断是title 还是img
        if let tit = title {
            button.setTitle(tit, forState: UIControlState.Normal)
            button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
            button.titleLabel?.font = UIFont.systemFontOfSize(15)
        }
        
        if let img = imgName {
            button.setImage(UIImage(named: img), forState: UIControlState.Normal)
        }
        // 给button添加点击时间
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        button.sizeToFit()
        self.customView = button
    }
}
