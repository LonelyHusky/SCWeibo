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
            retweetPictureViewSize = calcPictureViewSize(status?.retweeted_status?.pic_urls)
            originalPictureViewSize = calcPictureViewSize(status?.pic_urls)
        }
    
    }
//    当前微博用户的会员图标
    var memberIamge :UIImage?
//    转发微博的内容
    var retweetText : String?
//    来源字符串
    var sourcrText : String?
//    转发微博的配图视图大小
    var retweetPictureViewSize :CGSize = CGSizeZero
    var originalPictureViewSize:CGSize = CGSizeZero
    
    private func calcPictureViewSize(pic_urls:[SCStatusPhontoInfo]?) -> CGSize{
//    获取图片数量
        let count = pic_urls?.count ?? 0
        
        if count == 0 {
            return CGSizeZero
        }
//        根据count计算大小
//        求出几行几列
        let col = count == 4 ?  2 : (count > 3 ? 3 : count)
        let row = ((count - 1) / 3) + 1
        
//        计算图片大小
        let margin : CGFloat = 5
        let itemWH = (SCReenW - 2 * SCStatusCellMargin - 2 * margin) / 3
//        通过每张图片大小和列数求出宽度，行数求出高度
        let w = CGFloat(col) * itemWH + CGFloat(col - 1) * margin
        let h = CGFloat(row) * itemWH + CGFloat(row - 1) * margin

        return CGSize(width: w, height: h)
    }
    
    
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
