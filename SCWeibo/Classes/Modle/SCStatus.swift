//
//  SCStatus.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/23.
//
//

import UIKit

class SCStatus: NSObject {

//  当前微博的内容
    var text : String?
//    微博的创建时间
    var created_at :String?
//    来源
    var source: String?
//    当前用户信息
    var user :SCUser?
//    当前微博的转发微博
    var retweeted_status :SCStatus?
    
    
    
//    添加字典转模型的构造函数
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        if key == "user" {
        
            guard let dict = value as? [String : AnyObject] else{
                return
            }
            user = SCUser(dict: dict)
        }else if key == "retweeted_status" {
//            转发微博
            guard let dict = value as? [String : AnyObject] else{
                return
            }
            retweeted_status = SCStatus(dict: dict)
        }else{
            super.setValue(value, forKey: key)
        }
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
}
