//
//  SCUserAccountModel.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/23.
//
//

import UIKit
import SVProgressHUD
class SCUserAccountModel: NSObject {

    static let sharedMOdel:SCUserAccountModel = SCUserAccountModel()
    
    override init() {
        super.init()
//        代表当前  viewModel 初始化的时候，就尝试去沙盒中读取数据
        account = self.accountInSanbox()
    }
    
//    当前登入用户的帐号信息 －
    var account:SCUserAccount?
    
    var accessToken :String?{
        
        return self.account?.access_token
    }
    
    var isLogin:Bool{
    
//        1.是否有accessToken
        if accessToken == nil {
//        如何没有accessToken就代表没有登录 就 returen false
            return false
        }
//        2.accessToken是否过期
        guard let expiresDate = self.account?.expiresDate else{
            return false
        }
        
        
        if NSDate().compare(expiresDate) == .OrderedAscending {
//            没有过期就true
            return true
        }
        return false
    
    }
    
    
    
    func loadAccessToken(code:String,finished:(isSuccess:Bool)->()){
        
        let urlString = "https://api.weibo.com/oauth2/access_token"
        //
        //        必选	类型及范围	说明
        //        client_id	true	string	申请应用时分配的AppKey。
        //        client_secret	true	string	申请应用时分配的AppSecret。
        //        grant_type	true	string	请求的类型，填写authorization_code
        //
        //        grant_type为authorization_code时
        //        必选	类型及范围	说明
        //        code	true	string	调用authorize获得的code值。
        //        redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
        
        
        let parames = [
            "client_id":appKEY,
            "client_secret":appSecret,
            "grant_type":"authorization_code",
            "code":code,
            "redirect_uri":appUrl
        ]
        
        
        
        
        SCNetworkTools.sharedTools.request(.Post, urlString: urlString, parameters: parames) { (responseObject, error) in
            if error != nil{
                
                print(error)
                finished(isSuccess: false)
                return
            }
            print("请求成功:\(responseObject)")
            
            //            如果as是写在if let 或者 guard 里面 ，都是使用as？
            guard let dict = responseObject as? [String: AnyObject] else {
                print("后台返回数据格式不对")
                finished(isSuccess: false)

                return
            }
            
            let account = SCUserAccount(dict:dict)
            
            print(account)
            
            //            获取个人信息
            self.loadUserInfo(account,finished: finished)
            
            
            
        }
        
    }
    
    private func loadUserInfo(accout:SCUserAccount,finished:(isSuccess:Bool)->()){
        let urlString = "https://api.weibo.com/2/users/show.json"
        //        access_token	true	string	采用OAuth授权方式为必填参数，OAuth授权后获得。
        //        uid	false	int64	需要查询的用户ID。
        //        screen_name	false	string	需要查询的用户昵称。
        
        let params = [
            "access_token":accout.access_token ?? "",
            "uid":accout.uid ?? ""
            
        ]
        SCNetworkTools.sharedTools.request(urlString: urlString, parameters: params) { (responseObject, error) -> () in
            if error != nil{
                
                SVProgressHUD.showErrorWithStatus("网络错误")
                return
                
            }
            guard let dict = responseObject as? [String: AnyObject] else {
                print("后台返回数据格式不对")
                return
            }
            //            如果等于前面可选值的话就用as? 如果是必选值。就用as！
            accout.name = dict["name"] as? String
            accout.avatar_large = dict["avatar_large"] as? String
            print(accout)
            self.account = accout 
            self.saveAccount(accout)
            //            保存登录信息
            finished(isSuccess: true)

        }
        
        
    }
    private func saveAccount(account:SCUserAccount){
        
        let path = (NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! as NSString).stringByAppendingPathComponent("accout.archive")
        print(path)
        NSKeyedArchiver.archiveRootObject(account, toFile: path)
        
        
    }
    //    去沙盒中读取信息
    private func accountInSanbox() ->SCUserAccount?{
        let path = (NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! as NSString).stringByAppendingPathComponent("accout.archive")
        let result = NSKeyedUnarchiver.unarchiveObjectWithFile(path)as? SCUserAccount
        print(result)
        return result
        
        
        
    }

}
