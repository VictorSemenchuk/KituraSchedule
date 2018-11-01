//
//  AddrecordVC.swift
//  KituraTeamSchedule
//
//  Created by User on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var reasonCollectionView: UICollectionView!
    @IBOutlet weak var dateSetterView: KPIDateSetter!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var record: Record?
    var reasons: [Reason]?
    
    
    //MARK: - ViewController lifecycle
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //record
        self.record = Record.init(recordId: Int(arc4random_uniform(1000000)), userId:kCurrentUserId, startDate: dateSetterView.startTime ?? Date(), endDate: dateSetterView.endTime ?? Date(), reasonId: 0, details: "", reason: nil)
        
        
        let rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveActionHandler))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        self.descriptionTextField.delegate = self
        //configure collectionView
        self.configureCollectionView()
    }
    
    
    
    @objc func saveActionHandler() {
        guard let record = self.record else {
            
            return
        }
        
        Service.addRecord(record: record)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObserver()
    }
    
    
    //configure with record
    func configureWithRecord(record:Record) {
        self.record = record
    }
    
}









