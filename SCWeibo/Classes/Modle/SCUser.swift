
//
//  SCUser.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/24.
//
//

import UIKit

class SCUser: NSObject {
//用户头像地址 50*50
    var profile_image_url : String?
//    用户昵称
    var name : String?
//    会员等级
    var mbrank: Int = 0
    
    init(dict:[String:AnyObject]){
    
        super.init()

        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}
