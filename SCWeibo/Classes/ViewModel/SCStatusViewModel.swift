//
//  SCStatusViewModel.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/24.
//
//对应StatusCell

import UIKit

class SCStatusViewModel: NSObject {
    
//当前视图模型里面保存的模型
    var status : SCStatus?{
        didSet{
            dealMemberImage()
            dealSourceText()
//            设置转发微博的内容
            if let s = status?.retweeted_status {
//                @昵称：内容
                if let name = s.user?.name ,content = s.text {
                    retweetText = "@\(name):\(content)"
                }
            }
        }
    
    }
//    当前微博用户的会员图标
    var memberIamge :UIImage?
//    转发微博的内容
    var retweetText : String?
//    来源字符串
    var sourcrText : String?
    
    
    private func dealSourceText(){
        
        guard let s = status?.source else{
            return
        }
//        开始截取位置
        if let startIndex = s.rangeOfString("\">")?.endIndex, endIndex = s.rangeOfString("</")?.startIndex {
        
            let result = s.substringWithRange(startIndex..<endIndex)
            sourcrText = "来着\(result)"
            
        }

        
    
    }
    
    private func dealMemberImage(){
//    会员等级是1——6
        if let rank = status?.user?.mbrank where (rank > 0 && rank < 7){
        memberIamge = UIImage(named: "common_icon_membership_level\(rank)")
        }
      
    }
    
    
}
