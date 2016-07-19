//
//  SCHomeViewController.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/19.
//
//

import UIKit

class SCHomeViewController: SCVisitorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        func viewDidLoad() {
            super.viewDidLoad()
            
            
            if !isLogin {
                visitorView?.setupVisitorViewInfo(nil, title: nil)
                return
            }
            
            
            loadData()
        }
        
        func loadData(){
            
        }

    }
    

}
