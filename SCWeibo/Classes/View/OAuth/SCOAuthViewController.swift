//
//  SCOAuthViewController.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/22.
//
//

import UIKit
import SVProgressHUD
let appKEY = "958425496"
let appUrl = "http://www.baidu.com"
let appSecret = "a9bbb89c19b61a8426aeb04b376f8fa0"

class SCOAuthViewController: UIViewController {

//    给当前控制器根视图设置为webView
    override func loadView() {
        view = webView
//        
//        redirect_uri
//        App Key：958425496
//        App Secret：a9bbb89c19b61a8426aeb04b376f8fa0
        
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(appKEY)&redirect_uri=\(appUrl)"
        let url = NSURL(string: urlString)
        
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        
        setupUI()
    }

    private func setupUI(){
        self.view.backgroundColor = UIColor .whiteColor()
        navigationItem.leftBarButtonItem  = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(SCOAuthViewController.cancel))
     navigationItem.rightBarButtonItem  = UIBarButtonItem(title: "自动填充", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(SCOAuthViewController.autoFill))
    }
    
    
//    监听方法
   @objc private func cancel(){
    
        dismissViewControllerAnimated(true, completion: nil);
    }
    
   @objc private func autoFill(){
    
    let jsStr = "document.getElementById('userId').value='silen_sc@sina.cn';document.getElementById('passwd').value='shuchao1020'"
    
    webView.stringByEvaluatingJavaScriptFromString(jsStr)
    
    
    }
    
//    懒加载控件
    private lazy  var webView : UIWebView  = {
    
        let webView = UIWebView()
        webView.delegate = self
        
        return webView
  
    }()
 
}

extension SCOAuthViewController:UIWebViewDelegate{
    /*
     监听webView 将要加载的request
     - 其有返回值
     - 如果返回为true 代表继续加载
     - 如果返回为false 带包要停止加载
     - 默认如果不实现该方法 默认为true
     
     */
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//        取到请求里面的url
        guard let url = request.URL else{
            return false
        }
//        判断url的地址是否以回调页开头
        if url.absoluteString.hasPrefix(appUrl){
//        代表是以回调也开头
//            containsString：是否包含某个字符串
            if let q = url.query where q.containsString("code="){
//                截取授权码
                 let code = q.substringFromIndex("code=".endIndex)
                print(code)
//                通过code获取accessToken
                SCUserAccountModel.sharedMOdel.loadAccessToken(code, finished: { (isSuccess) in
                    if isSuccess{
//                    关闭当前界面
//                        切换控制器
                        self.dismissViewControllerAnimated(false, completion: { () -> Void in
//                            当前界面关闭完成之后，跳转到欢迎页面
//                          let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
//                            appDelegate?.window?.rootViewController = SCWeiIconViewController()

                            NSNotificationCenter.defaultCenter().postNotificationName(SCChangeRootVCNotification, object: self)
                            
                        })
                    }else{
                    
//                        给提示，登入失败
                    }
                })
                
            }
            
        return false
            
        }
 
        return true
    }
    
    
    
    
    
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }

}




























