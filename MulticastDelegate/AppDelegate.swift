//
//  AppDelegate.swift
//  MulticastDelegate
//
//  Created by Yury Buslovsky on 03.07.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let tabBarController = UITabBarController()
        
        tabBarController.setViewControllers(
            (1...3).map {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateInitialViewController() as! ViewController
                vc.title = "View Controller #\($0)"
                return vc
            },
            animated: false
        )
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }

}

