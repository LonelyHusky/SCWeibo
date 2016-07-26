//
//  SCStatusPhontoInfo.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/25.
//
//配图模型

import UIKit

class SCStatusPhontoInfo: NSObject {

    
    //缩略配图
    var thumbnail_pic :String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)

    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
