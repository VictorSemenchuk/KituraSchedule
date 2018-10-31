//
//  ViewController.swift
//  KituraTeamSchedule
//
//  Created by serverVITK on 10/25/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

class RecordsViewController: UIViewController {
    
    //MARK:- Properties
    
    var tableView: UITableView?
    var dataSource: [Record] = []
    var user: User?
    
    //MARK:- Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        self.generateDataSource()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let table = self.tableView else { fatalError("TableView in VC doesn't exist viewDidLayoutSubviews method") }
        self.applyConstraints(to: table)
        table.tableFooterView = UIView(frame: CGRect.zero)
        table.separatorInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        table.separatorColor = UIColor(red: 224.0/255.0, green: 236.0/255.0, blue: 241.0/255.0, alpha: 255.0/255.0)
    }
    
    //MARK:- Methods
    
    @objc func addNewRecordToTimesTable(sender: UIButton) {
        let addrecordVC = AddRecordViewController.init(nibName: "AddRecordViewController", bundle: nil)
        self.navigationController?.pushViewController(addrecordVC, animated: true)
    }
    
    func generateDataSource() {
        var id = 1
        if let user = self.user {
            id = user.id
            self.navigationItem.rightBarButtonItem = nil
        }
        
        Service.getRecordsByUserID(userId: id) { [weak self] (records, error) in
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
                if let error = error {
                    strongSelf.showAlertWithTitle("Error", message: error.localizedDescription)
                } else {
                    if let records = records {
                        strongSelf.dataSource = records
                        strongSelf.tableView?.reloadData()
                    }
                }
            }
        }
    }
    
}










