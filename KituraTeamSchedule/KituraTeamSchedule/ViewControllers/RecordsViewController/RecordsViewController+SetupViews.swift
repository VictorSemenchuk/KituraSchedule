//
//  RecordsViewController+SetupViews.swift
//  KituraTeamSchedule
//
//  Created by Viktar Semianchuk on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

extension RecordsViewController {
    
    func setupViews() {
        self.tableView = self.setUpTableView()
        self.createAddBttn()
    }
    
    private func setUpTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: UITableViewStyle.plain)
        tableView.backgroundColor = UIColor.white
        tableView.register(UINib.init(nibName: "\(RLTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kCellId)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        return tableView
    }
    
    func applyConstraints(to tableView: UITableView) {
        let safeArea: UILayoutGuide = self.view.safeAreaLayoutGuide
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0).isActive = true
    }
    
    func createAddBttn() {
        let rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addNewRecordToTimesTable))
        rightBarButtonItem.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
}
