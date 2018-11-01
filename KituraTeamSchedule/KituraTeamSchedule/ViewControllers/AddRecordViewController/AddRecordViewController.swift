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
    var newRecord: Record?
    var reasons: [Reason]?
    
    //MARK: - ViewController initializtion
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, record: Record? = nil) {
        self.record = record
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - ViewController lifecycle
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //record
        self.newRecord = Record.init(recordId: Int(arc4random_uniform(1000000)), userId:kCurrentUserId, startDate: dateSetterView.startTime ?? Date(), endDate: dateSetterView.endTime ?? Date(), reasonId: 1, details: "", reason: nil)
        
        self.configureWithRecord(record: self.record)
        let rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveActionHandler))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        self.descriptionTextField.delegate = self
        //configure collectionView
        self.configureCollectionView()
    }
    
    
    
    @objc func saveActionHandler() {
        guard let start = self.dateSetterView.startTime, let end = self.dateSetterView.endTime, let details = self.descriptionTextField.text else {print("startTime \(self.dateSetterView.startTime)\n\(self.dateSetterView.endTime)\n\(self.descriptionTextField.text)"); return }
        
        if  self.record != nil {
                self.record?.startDate = start
                self.record?.endDate = end
                self.record?.details = details
            Service.updateRecord(record: self.record!) {
                self.navigationController?.popViewController(animated: true)
            }
        } else if self.newRecord != nil {
            self.newRecord?.startDate = start
            self.newRecord?.endDate = end
            self.newRecord?.details = details
            Service.addRecord(record: self.newRecord!) {
                self.navigationController?.popViewController(animated: true)
            }
        }
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
    func configureWithRecord(record:Record?) {
        guard let validRecord = self.record else { print("No RECORD; Consider to add NEW ONE"); return }
        print("RECORD \(validRecord)")
        
        let startDate = validRecord.startDate.dateComponents()
        let endDate =  validRecord.endDate.dateComponents()
        self.dateSetterView.startTimeText.text = startDate.longStyleDate
        self.dateSetterView.startTime = validRecord.startDate
        print("startTimeText \(startDate.longStyleDate)")
        self.dateSetterView.endTimeText.text = endDate.shortStyleTime
        self.dateSetterView.endTime = validRecord.endDate
        print("endTimeText \(endDate.shortStyleTime)")
        self.descriptionTextField.text = validRecord.details
    }
    
}









