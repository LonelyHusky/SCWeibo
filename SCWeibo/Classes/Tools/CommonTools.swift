
//
//  CommonTools.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/23.
//
//

import UIKit
//切换根控制器的通知
let SCChangeRootVCNotification = "SCChangeRootVCNotification"


//随机颜色
var RandomColor :UIColor{
    
    return UIColor(red: CGFloat(random()%256)/255, green: CGFloat(random()%256)/255, blue: CGFloat(random()%256)/255, alpha: 1)

}

//屏幕宽高

let SCReenW = UIScreen.mainScreen().bounds.size.width
let SCReenH = UIScreen.mainScreen().bounds.size.height

























         