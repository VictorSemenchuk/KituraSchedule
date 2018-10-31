//
//  AddRecordViewController.swift
//  KituraTeamSchedule
//
//  Created by User on 10/30/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import UIKit

enum Presentation {
    case pushed
    case presentedModally
}

class AddRecordViewController: UIViewController {
    
    private let personalTimeTable: Dictionary<String,String>?
    var presentation: Presentation
    var datePicker: UIDatePicker?
    var pickerView: UIPickerView?
    var reasonTextField: UITextField?
    fileprivate let pickerData: [String] = ["family", "work", "personal"]
    
    init(with persData: [String:String]? = nil, presentation: Presentation, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.personalTimeTable = persData
        self.presentation = presentation
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createBackBttn()
        self.pickerView = self.createPickerView()
        self.datePicker = self.createDatePickerView()
        self.reasonTextField = self.createReasonTextField()
        if let personalData = self.personalTimeTable {
            _ = personalData.map { print($0) }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        self.applyConstraints(to: self.pickerView!, superViewElem: self.view, withConstants: 200, leading: 0, trail: 0, bottom: -450)
    }
    
    func createReasonTextField() -> UITextField {
        return UITextField()
    }
    
    func createPickerView() -> UIPickerView {
        let pickerView = UIPickerView.init(frame: .zero)
        pickerView.backgroundColor = UIColor.clear
        pickerView.layer.borderWidth = 1
        pickerView.layer.borderColor = UIColor.black.cgColor
        pickerView.dataSource = self
        pickerView.delegate = self
        self.view.addSubview(pickerView)
        return pickerView
    }
    
    func createDatePickerView() -> UIDatePicker {
        let datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 400, width: self.view.frame.width, height: 150))
        datePicker.backgroundColor = UIColor.clear
        datePicker.layer.borderWidth = 1
        datePicker.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(datePicker)
        return datePicker
    }
    
    func createBackBttn() {
        let bttn = UIButton.init(type: .custom)
        bttn.frame = CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50)
        let title: String = (self.presentation == .pushed) ? "Add TASK" : "Save&GoBack"
        bttn.setTitle(title, for: .normal)
        bttn.setTitleColor(UIColor.black, for: .normal)
        bttn.backgroundColor = UIColor.green
        bttn.addTarget(self, action: #selector(goBackToVC), for: .touchUpInside)
        self.view.addSubview(bttn)
    }
    
    @objc func goBackToVC(sender: UIButton) {
        let isPushed: Bool = (self.presentation == .pushed) ? true : false
        if isPushed {
            print("Created new record successfully")
            self.navigationController?.popViewController(animated: true)
        } else {
            print("Updated record successfully")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func applyConstraintsToTextField() {
        let safeArea = self.view.safeAreaLayoutGuide
        self.reasonTextField?.translatesAutoresizingMaskIntoConstraints = false
        self.reasonTextField?.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50).isActive = true
        self.reasonTextField?.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0).isActive = true
        self.reasonTextField?.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0).isActive = true
        self.reasonTextField?.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 0).isActive = true
    }
    
    func applyConstraintsToPickerView() {
        
    }
    
    func applyConstraintsToDatePicker() {
        
    }
}

extension AddRecordViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Get selected data here
    }
    
}





