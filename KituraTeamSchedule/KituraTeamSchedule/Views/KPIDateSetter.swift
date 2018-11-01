//
//  KPIDateSetter.swift
//  DatePickerKPI
//
//  Created by Pavel Koka on 10/31/18.
//  Copyright © 2018 Crew. All rights reserved.
//

import UIKit

class KPIDateSetter:UIView {
    let nibName = "KPIDateSetter"
    var contentView:UIView?
    
    @IBOutlet weak var startTimeText: UITextField!
    @IBOutlet weak var endTimeText: UITextField!
    
    var startTime:Date?
    var endTime:Date?
    
    private var datePicker:UIDatePicker?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    override func didMoveToSuperview() {
        
        configureDatePicker()
        configuerToolBar()
    }
    
    func configureDatePicker(){
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.backgroundColor = UIColor.white
        datePicker?.minuteInterval = 10
        startTimeText.inputView = datePicker
        endTimeText.inputView = datePicker
        
        datePicker?.addTarget(self, action: #selector(KPIDateSetter.dateChanged(datePicker:)), for: .valueChanged)
    }
    
    func configuerToolBar(){
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        endTimeText.inputAccessoryView = toolBar
        startTimeText.inputAccessoryView = toolBar
    }
    
   @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "MM/dd HH:mm"
    
    if startTimeText.isEditing {
        startTime = datePicker.date
        startTimeText.text = dateFormatter.string(from: datePicker.date)
        
        } else if endTimeText.isEditing {
            endTime = datePicker.date
            endTimeText.text = dateFormatter.string(from: datePicker.date)
        }
    }
    
    @objc func doneClick() {
        self.endEditing(true)
    }
    
}
