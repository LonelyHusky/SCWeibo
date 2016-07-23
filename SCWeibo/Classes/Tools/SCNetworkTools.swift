//
//  SCNetworkTools.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/23.
//
//

import UIKit
import AFNetworking

enum SCRequestMethod:String {
    case Post = "post"
    case Get = "get"
}






class SCNetworkTools: AFHTTPSessionManager {

//    单例：全局访问点
    static let sharedTools: SCNetworkTools = {
    
        let tools = SCNetworkTools()
        
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")

        return tools
    }()
//      定义请求
    typealias SCRequestCallBack = (responseObject:AnyObject?,error:NSError?)->()
    
    func request(method:SCRequestMethod = .Get,urlString:String ,parameters:AnyObject?,finished:SCRequestCallBack)  {
//      定义一个请求成功之后要执行的闭包
        let success = {(dataTasks:NSURLSessionTask,responseObject:AnyObject?)-> Void in
        
//            请求成功的回调
            finished(responseObject:responseObject,error: nil)
        }
//        定义一个请求失败之后要执行的闭包
        let failure = { (dataTasks:NSURLSessionDataTask?,error:NSError) ->Void in
            finished(responseObject:nil,error: error)
        
        }
        
        if method == .Get {
            GET(urlString,parameters: parameters,progress: nil,success: success,failure: failure)
        }else{
            POST(urlString, parameters: parameters, progress: nil,success: success, failure: failure)
        }
        
        
    }
    
}


















