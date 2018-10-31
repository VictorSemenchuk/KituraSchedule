//
//  RLTableViewConfiguration.swift
//  KituraTeamSchedule
//
//  Created by User on 10/30/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    func setUpTableView() -> UITableView {
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
    
}
