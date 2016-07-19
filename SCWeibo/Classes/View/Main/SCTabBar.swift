//
//  SCTabBar.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/19.
//
//

import UIKit

class SCTabBar: UITabBar {
   
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
       addSubview(composeButton)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
                index++
                if index == 2 {
                    index++
                }
                
            }
        
        
        }
        
    }
    
    
    private lazy var composeButton: UIButton = {
        let button = UIButton()
        //
        button.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        button.setImage(UIImage(named:"tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        button.setBackgroundImage(UIImage(named:"tabbar_compose_button"), forState: UIControlState.Normal)
        button.sizeToFit()
        
        return button
    }()
  
    
}


























    