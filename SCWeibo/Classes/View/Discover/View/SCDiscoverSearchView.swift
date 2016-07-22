//
//  SCDiscoverSearchView.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/22.
//
//

import UIKit

class SCDiscoverSearchView: UIView {

    override init(frame: CGRect) {
        super.init(frame:CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 35)
 )
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
    
        backgroundColor = UIColor .orangeColor()
//        添加控件
        addSubview(cancelButton)
        addSubview(textField)
        cancelButton.snp_makeConstraints { (make) in
            make.width.equalTo(50)
            make.top.bottom.trailing.equalTo(self)
        }
        textField.snp_makeConstraints { (make) in
            make.top.leading.bottom.equalTo(self)
            make.trailing.equalTo(self)
        }
        
        
    }
    
    func didClickCancelButton() {
        // 更新约束
        self.textField.snp_updateConstraints { (make) -> Void in
            make.trailing.equalTo(self)
        }
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.layoutIfNeeded()
        }) { (_) -> Void in
            // 取消第一响应者
            self.textField.resignFirstResponder()
        }
    }
    
    
    private lazy var cancelButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(SCDiscoverSearchView.didClickCancelButton), forControlEvents: UIControlEvents.TouchUpInside)
        button.setTitle("取消", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(15)
        return button
    }()
    
    
    private lazy var textField:UITextField = {
        let img = UIImageView()
        img.image = UIImage(named: "searchbar_textfield_search_icon")
        img.contentMode = .Center
        img.frame.size = CGSize(width: 35, height: 35)
        
        let text = UITextField()
        text.layer.borderWidth = 2
        text.backgroundColor = UIColor .whiteColor()
        text.placeholder = "请输入你想搜索的内容"
        text.layer.borderColor = UIColor .orangeColor().CGColor
        text.leftView = img
        text.leftViewMode = .Always
        text.delegate = self
        return text
    
    }()
 
}

extension SCDiscoverSearchView: UITextFieldDelegate {
    func textFieldDidBeginEditing(textField: UITextField) {
        self.textField.snp_updateConstraints { (make) -> Void in
            make.trailing.equalTo(self).offset(-50)
        }
        
        UIView.animateWithDuration(0.25) { () -> Void in
            self.layoutIfNeeded()
        }
        
    }
}