//
//  UserListViewController.swift
//  KituraTeamSchedule
//
//  Created by Dzmitry Tarelkin on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var users: [User]?
    var usersDictionary: [String:[User]]?
    var usersTitles:[String]?
    
    
    //MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.setupViews()
        self.fetchUsers()
    }
    
    
    func setupViews() {
        //register cell
        self.tableView.register(UINib.init(nibName: kUserControllerCellNibName, bundle: Bundle.main), forCellReuseIdentifier: kUserTableViewCellIdentifier)
        
        //footerView
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 224.0/255.0, green: 236.0/255.0, blue: 241.0/255.0, alpha: 255.0/255.0)
        
        //refresh control
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshContacts(refreshControl:)), for: .valueChanged)
        refreshControl.backgroundColor = UIColor.clear
        refreshControl.tintColor = UIColor.darkGray
        self.tableView.refreshControl = refreshControl
        
        //logoutbutton
        let rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logoutUser))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func logoutUser(){
        UIView.animate(withDuration: 0.4, animations: {
            self.tabBarController?.tabBar.alpha = 0
            self.view.alpha = 0
            self.navigationController?.navigationBar.alpha = 0
        }) { (isFinished) in
            if isFinished {
                Navigation.changeRootVCTo(rootVCType: .Welcome)
            }
        }
    }

    @objc private func refreshContacts(refreshControl: UIRefreshControl) {
        print("refresh!")
        
        UIView.animate(withDuration: 0.5) {
            self.view.alpha = 0.3
        }
        
        //fetching Users
       self.fetchUsers()
    }
}
