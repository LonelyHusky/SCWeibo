//
//  SCTabBar.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/19.
//
//

import UIKit
// 使用weak 修饰 需要继承NSObjectProtocol
protocol SCTabBarDelegate:NSObjectProtocol{
    // 协议方法
    func composeButtonClick()
}


class SCTabBar: UITabBar {
    // 声明代理
    weak var shDelegate:SCTabBarDelegate?
    
    var closure:(()->())?
    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - 监听方法
    func buttonClick(){
        //shDelegate?.composeButtonClick()
        closure?()
    }
    
    // MARK: - 设置视图
    private func setupUI(){
        // 添加控件
        addSubview(composeButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        composeButton.center = CGPoint(x: self.frame.width * 0.5,y:self.frame.height * 0.5) 
        
        
        let itemW = self.frame.width/5
        var index = 0
        
        for value in subviews {
            if value.isKindOfClass(NSClassFromString("UITabBarButton")!) {
                
                value.frame.size.width = itemW
                value.frame.origin.x = CGFloat(index) * itemW
                    index+=1
                if index == 2 {
                    index+=1
                }
//                index%2  == 0 
            }
        
        
        }
        
    }
    
   
    
    
    lazy var composeButton: UIButton = {
        let button = UIButton()
//        监听点击时间
        button.addTarget(self, action: #selector(buttonClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        //
        button.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        button.setImage(UIImage(named:"tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        button.setBackgroundImage(UIImage(named:"tabbar_compose_button"), forState: UIControlState.Normal)
        button.sizeToFit()
        
        return button
    }()
  
    
}


























    