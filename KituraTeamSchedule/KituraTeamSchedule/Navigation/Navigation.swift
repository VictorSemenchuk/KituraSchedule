//
//  Navigation.swift
//  KituraTeamSchedule
//
//  Created by Dzmitry Tarelkin on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import UIKit



class Navigation {
    
    //MARK: - Configurating
    
    public enum RootVC {
        case TabBar
        case Welcome
    }
    
    static var currentUser:User?
    //MARK: - Login checking
    
    static func checkLoginnedUser() {
        Navigation.changeRootVCTo(rootVCType: .Welcome)
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.0/255.0, green: 186.0/255.0, blue: 230.0/255.0, alpha: 255.0/255.0)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        
        UITabBar.appearance().barTintColor = UIColor(red: 0.0/255.0, green: 186.0/255.0, blue: 230.0/255.0, alpha: 255.0/255.0)
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    //MARK: - Switching between windows
    
    @discardableResult static func changeRootVCTo(rootVCType:RootVC)  -> Bool {
        guard let appDelegate = UIApplication.shared.delegate,
            let appWindow  = appDelegate.window else {return false}
        
        let newRootVC: UIViewController
        
        if rootVCType == .TabBar {
            newRootVC = Navigation.configureTabBar()
        } else {
            newRootVC = WelcomeViewController()
        }
        
        let prevVC = appWindow?.rootViewController
        prevVC?.view.alpha = 0
        prevVC?.dismiss(animated: false, completion: {
            prevVC?.view.removeFromSuperview()
        })
        
        //assign new root vc
        newRootVC.view.alpha = 0
        appWindow?.rootViewController = newRootVC
        
        UIView.animate(withDuration: 0.4) {
            newRootVC.view.alpha = 1
        }
        
        return true
    }
    
    static fileprivate func configureTabBar() -> UITabBarController {
        let tabBar = KituraTabBarController()
        return tabBar
    }
    
    //MARK: - ShowAlert
    
    public static func showAlertWithErrorMessage(from controller: UIViewController ,title:String, message:String, completionAfterAction: (()->())?) {
        let msg = message
        let capTitle = title.capitalized
        let alert = UIAlertController(title: capTitle, message: msg, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .destructive) { (action) in
            
            guard let completion = completionAfterAction else {return}
            completion()
        }
        
        alert.addAction(action)
        controller.present(alert, animated: true, completion: nil)
    }
 
}
