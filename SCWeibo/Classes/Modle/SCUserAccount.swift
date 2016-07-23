//
//  SCUserAccount.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/23.
//
//

import UIKit

class SCUserAccount: NSObject , NSCoding{
    
//    access_token" = "2.00uL8vhCkP9rCBebe45a4a230Z8ikJ";
//    "expires_in" = 157679999;
//    "remind_in" = 157679999;
//    uid = 2481337334;
    
    
    var access_token :String?
    var expires_in:NSTimeInterval = 0{
        didSet{
//            计算过期时间
            expiresDate = NSDate(timeIntervalSinceNow: expires_in)
        }
    
    }
    var remind_in : String?
    var uid:String?
    var name:String?
//    过期时间
    var expiresDate :NSDate?
    
    
//    用户头像
    var avatar_large :String?
    
    
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
//    实现代理方法
//    解挡
    required init?(coder aDecoder: NSCoder) {
        uid = aDecoder.decodeObjectForKey("uid") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        remind_in = aDecoder.decodeObjectForKey("remind_in") as? String
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        avatar_large = aDecoder.decodeObjectForKey("avatar_large") as? String
        expires_in = aDecoder.decodeDoubleForKey("expires_in")
        
        expiresDate  = aDecoder.decodeObjectForKey("expiresDate")as? NSDate
        

    }
//    归档
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(uid,forKey: "uid")
        aCoder.encodeObject(name,forKey: "name")
        aCoder.encodeObject(remind_in,forKey: "remind_in")
        aCoder.encodeDouble(expires_in, forKey: "expires_in")
        aCoder.encodeObject(access_token,forKey: "access_token")
        aCoder.encodeObject(avatar_large, forKey: "avatar_large")
        
        aCoder.encodeObject(expiresDate,forKey: "expiresDate")
    }
}




































