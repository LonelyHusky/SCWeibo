//
//  SCStatusListViewModel.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/23.
//
// 当前ViewModel对应的是HomeVC

import UIKit

class SCStatusListViewModel: NSObject {
    
    var statusArray = [SCStatusViewModel]()
//    var statusArray : [SCStatus]?

    
    
    func loadData(finished: (isSuccess:Bool) -> ()){
        //        1.定义请求地址
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        //        2.定义请求参数
        let params = [
            "access_token":SCUserAccountModel.sharedMOdel.accessToken ?? ""]
        
        
        
        //        3.发送请求
        SCNetworkTools.sharedTools.request(urlString: urlString, parameters: params) { (responseObject, error) -> () in
            
            guard let response = responseObject as? [String:AnyObject] else{
                
                print("error = \(error)")
                finished(isSuccess:false)
                return
            }
            
//            print("response = \(response)")
            //1.取出status 对应节点的数据
            guard let dicts = response["statuses"] as? [[String:AnyObject]] else {
               
                finished(isSuccess:false)

                return
            }
            
            //                初始化一个空数组
            var tempArray = [SCStatusViewModel]()
            //                2.便利字典数组，进行转模型
            for value in dicts{
                let status = SCStatus(dict: value)
//                初始化一个model
                let viewModel = SCStatusViewModel()
                viewModel.status = status
                tempArray.append(viewModel)
            }
            self.statusArray = tempArray
            finished(isSuccess:true)
            
            
//            self.cachSingleImage()
        }
    }

    
}
