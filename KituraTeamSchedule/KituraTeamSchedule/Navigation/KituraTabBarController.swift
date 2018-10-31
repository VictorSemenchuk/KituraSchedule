//
//  KituraTabBarController.swift
//  KituraTeamSchedule
//
//  Created by Dzmitry Tarelkin on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import UIKit

class KituraTabBarController: UITabBarController {
    
    
    //MARK:- LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK:- Methods
    
    private func setupViews() {
        tabBar.isTranslucent = false
        view.layer.backgroundColor = UIColor.white.cgColor
        configureTabs()
    }
    
    private func configureTabs() {
        let contacts = configureController(controller: UserListViewController(), image:#imageLiteral(resourceName: "contacts"), selectedImage: #imageLiteral(resourceName: "contacts2"), title: "Users")
        let chatList = configureController(controller: RecordsViewController(), image: #imageLiteral(resourceName: "schedule"), selectedImage: #imageLiteral(resourceName: "schedule2"), title: "Schedule")
    
        setViewControllers([contacts,chatList], animated: true)
    }
    
    private func configureController(controller: UIViewController, image: UIImage, selectedImage: UIImage, title: String) -> UINavigationController{
        let nav = UINavigationController(rootViewController: controller)
        controller.navigationItem.title = title
        controller.tabBarItem.title = title
        controller.tabBarItem.image = image
        controller.tabBarItem.selectedImage = selectedImage
        return nav
    }
    
}
