//
//  RecordsViewController+TableView.swift
//  KituraTeamSchedule
//
//  Created by Viktar Semianchuk on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

extension RecordsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath) as! RLTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! RLTableViewCell
        cell.fillTheCell(self.dataSource[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let user = self.user, user.id != kCurrentUserId {
            tableView.deselectRow(at: indexPath, animated: true)
            return
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
            let record = self.dataSource[indexPath.row]
            let recocdVC = RecordViewController.init(nibName: "AddRecordViewController", bundle: nil, record: record)
            self.navigationController?.pushViewController(recocdVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if let user = self.user, user.id == kCurrentUserId {
            return true
        } else if user == nil {
            return true
        } else  {
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let record = self.dataSource[indexPath.row]
            Service.removeRecord(record: record) {error in 
                self.dataSource.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
            }
        }
    }
    
}
