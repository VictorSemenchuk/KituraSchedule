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
        
        //W: fetch records by kCurrentUserId
//        guard let records = self.dataSource else {
//            cell.record = fetchedRecord
//        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! RLTableViewCell
        cell.fillTheCell(self.dataSource[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //W: throw record to this controller .record = fetched record
        tableView.deselectRow(at: indexPath, animated: true)
        let record = self.dataSource[indexPath.row]
        let recocdVC = RecordViewController.init(nibName: "AddRecordViewController", bundle: nil, record: record)
        self.navigationController?.pushViewController(recocdVC, animated: true)
//        self.present(recocdVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
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
