//
//  AppDelegate.swift
//  KituraTeamSchedule
//
//  Created by serverVITK on 10/25/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        let initialVC = RecordsViewController()
        initialVC.title = "Tasks"
        let navController = UINavigationController.init(rootViewController: initialVC)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.0/255.0, green: 186.0/255.0, blue: 230.0/255.0, alpha: 255.0/255.0)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        
        return true
    }


}

