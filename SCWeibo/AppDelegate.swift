//
//  AppDelegate.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/19.
//  Copyright © 2016年 sc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.changeRootVC(_:)), name: SCChangeRootVCNotification, object: nil)
        
        self.window = UIWindow(frame:UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
//        2.设置根控制器。 是否登录，如果没有登录 就进mainVc。登录啦 就进 weiVC
//        self.window?.rootViewController = SCMainViewController()
        window?.rootViewController = SCUserAccountModel.sharedMOdel.isLogin ? SCWeiIconViewController() : SCMainViewController()
        
        
        self.window?.makeKeyAndVisible()
        
        
        
        
        
        
         setupAppStyle()
        
        
        
        
        return true
    }

    func changeRootVC(noti:NSNotification) {
        
        if noti.object != nil {
            window?.rootViewController = SCWeiIconViewController()

        }else{
            window?.rootViewController = SCMainViewController()
            
        }
        
    }
    
    
    func setupAppStyle(){
        // 设置tintColor 设置控件颜色 （全局使用, 必须在我们项目初始化之前设置）
        // UITabBar.appearance().tintColor = UIColor.orangeColor()
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
    }

    //移除所以通知
    
    deinit {
        
    NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }
    
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

