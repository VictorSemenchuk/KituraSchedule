//
//  UserListViewController+FetchUsers.swift
//  KituraTeamSchedule
//
//  Created by Dzmitry Tarelkin on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import UIKit

extension UserListViewController {
    
    func fetchUsers() {
        self.tableView.refreshControl?.beginRefreshing()
        Service.getUsers { (users, error) in
            self.tableView.refreshControl?.endRefreshing()
            
            guard let users = users else {
                self.showAlertWithTitle("Error", message: error?.localizedDescription)
                return
            }
            
            //get users
            let tupleOfUsersAndTitle = Dictionary<String, Any>.makeDictionaryFrom(users: users)
            self.usersDictionary = tupleOfUsersAndTitle.dict
            self.usersTitles = tupleOfUsersAndTitle.sortedKeys
            self.users = users
            self.tableView.reloadData()
            
            UIView.animate(withDuration: 0.5, animations: {
                self.view.alpha = 1
            })
        }
    }
}
