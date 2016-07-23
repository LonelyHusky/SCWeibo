//
//  SCVisitorViewController.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/20.
//
//


import UIKit

class SCVisitorViewController: UIViewController {
   
    var isLogin : Bool = SCUserAccountModel.sharedMOdel.isLogin
    
    var visitorView : SCVisitorView?
    
    // MARK: - 监听方法
    @objc private func loginClick(){
        let vc = SCOAuthViewController()
        self.presentViewController(UINavigationController.init(rootViewController: vc), animated: true, completion: nil)
    }
    
    override func loadView() {
        isLogin ? (view = tableView) : setupVisitorView()
    }
    
    // MARK: -  设置访客视图
    func setupVisitorView(){
        visitorView = SCVisitorView()
        visitorView?.closure = {
            let vc = SCOAuthViewController()
            self.presentViewController(UINavigationController.init(rootViewController: vc), animated: true, completion: nil)
        }
        view = visitorView
        setupNav()
    }
    
  
    
    // MARK: - 设置导航按钮
    func setupNav(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "登录", target: self, action: #selector(SCVisitorViewController.loginClick))
        navigationItem.rightBarButtonItem = SCBarButtonItem(title: "注册", target: self, action: #selector(SCVisitorViewController.loginClick))
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
}
    
    func setupUI(){
        
    }
    // MARK: -  懒加载控件
    lazy var tableView: UITableView = UITableView()

}



























