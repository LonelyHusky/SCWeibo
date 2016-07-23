//
//  SCHomeViewController.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/19.
//
//

import UIKit

class SCHomeViewController: SCVisitorViewController {

    //cell ID
    let SCStatusID = "SCStatusCell"
    
    var statusArray = [SCStatus]()
    
    private lazy var statusListViewModel : SCStatusListViewModel = SCStatusListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !isLogin {
            visitorView?.setupVisitorViewInfo(nil, title: nil)
            return
        }

        setupUI()
        //   网络请求
        loadData()

    }
    
    private func setupUI(){
        
        tableView.dataSource = self

        tableView.registerClass(SCStatusCell.self, forCellReuseIdentifier: SCStatusID)
//        自动计算行高
        tableView.rowHeight = UITableViewAutomaticDimension
//        设置预估行高。确认在所有的 cell 在没有加载完成之前的tableView的contentSize。让tableView滚动起来
        tableView.estimatedRowHeight = 200
//        隐藏分割线
        tableView.separatorStyle = .None
        
        tableView.backgroundColor = UIColor(white: 242/255, alpha: 1)

    }

    
    private func loadData(){
        statusListViewModel.loadData { (isSuccess) in
            if isSuccess{
//            刷新tebVIew
                self.tableView.reloadData()
            
            }else{
            
                print("数据请求失败")
            }
        }
}
}

extension SCHomeViewController:UITableViewDataSource{
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return statusListViewModel.statusArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(SCStatusID, forIndexPath: indexPath) as! SCStatusCell
        
        //        给cell附值
        cell.statusViewModel = statusListViewModel.statusArray[indexPath.row]
        return cell
        
    }
}









