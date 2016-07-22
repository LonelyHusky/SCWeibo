//
//  SCOAuthViewController.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/22.
//
//

import UIKit
let appKEY = "958425496"
let appUrl = "http://www.baidu.com"


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
    
    
    }
    
//    懒加载控件
    private lazy  var webView : UIWebView  = {
    
        let webView = UIWebView()
        return webView
  
    }()
    
}
