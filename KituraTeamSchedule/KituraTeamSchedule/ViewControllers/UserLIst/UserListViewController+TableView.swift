//
//  UserListViewController+TableView.swift
//  KituraTeamSchedule
//
//  Created by Dzmitry Tarelkin on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import UIKit

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let titles = self.usersTitles else { return 0 }
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let titles = self.usersTitles else { return "" }
        return titles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let titles = self.usersTitles,
            let dictionary = self.usersDictionary,
            let sectionValues = dictionary[titles[section]] else { return 0 }
        
        return sectionValues.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kUserTableViewCellIdentifier) as? UserTableViewCell,
            let sectionTitle = self.usersTitles,
            let sectionDict = self.usersDictionary,
            let sectionValues = sectionDict[sectionTitle[indexPath.section]] else { return UserTableViewCell() }
        
        //contact
        let contact = sectionValues[indexPath.row]
        cell.configureViewWithUser(user: contact)
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.usersTitles
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let titles = self.usersTitles,
            let titleIndex = titles.index(of: title) else { return 0 }
        return titleIndex
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let sectionTitle = self.usersTitles,
            let sectionDict = self.usersDictionary,
            let sectionValues = sectionDict[sectionTitle[indexPath.section]] else { return }
       
        
        let user = sectionValues[indexPath.row]
      //here go to records
    }
    
}
