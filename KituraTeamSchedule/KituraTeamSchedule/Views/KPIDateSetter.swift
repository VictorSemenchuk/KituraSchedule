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
    private var myPicker:UIDatePicker?
    
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
        configureTimePicker()
    }
    
    func configureDatePicker(){
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.backgroundColor = UIColor.white
        datePicker?.minuteInterval = 10
        startTimeText.inputView = datePicker
        
        datePicker?.addTarget(self, action: #selector(KPIDateSetter.dateChanged(datePicker:)), for: .valueChanged)
    }
    
    func configureTimePicker() {
        myPicker = UIDatePicker()
        myPicker?.datePickerMode = .time
        myPicker?.backgroundColor = UIColor.white
        myPicker?.minuteInterval = 10
        endTimeText.inputView = self.myPicker
        
        myPicker?.addTarget(self, action: #selector(KPIDateSetter.dateMy(sender:)), for: .valueChanged)
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
    
   @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.dateFormat = "MM.dd.EEEE HH:mm"
    if let end = self.endTime {
        let calendar = Calendar.current
        let time = calendar.component(.hour, from: datePicker.date)
        let time2 = calendar.component(.hour, from: end)
        let min = calendar.component(.minute, from: datePicker.date)
        let min2 = calendar.component(.minute, from: end)
        
        if startTimeText.isEditing {
            if (time < time2) || (time == time2 && min < min2) {
                startTime = datePicker.date
                startTimeText.text = dateFormatter.string(from: datePicker.date)
            }
        }
    } else {
        startTime = datePicker.date
        startTimeText.text = dateFormatter.string(from: datePicker.date)
    }
}
    
    @objc func dateMy(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.dateFormat = "HH:mm"
        if let start = self.startTime {
            let calendar = Calendar.current
            let time = calendar.component(.hour, from: sender.date)
            let time2 = calendar.component(.hour, from: start)
            let min = calendar.component(.minute, from: sender.date)
            let min2 = calendar.component(.minute, from: start)
            
            if endTimeText.isEditing {
                if (time > time2) || (time == time2 &&  min > min2) {
                    endTime = sender.date
                    endTimeText.text = dateFormatter.string(from: sender.date)
                }
                
            }
        } else {
            endTime = sender.date
            endTimeText.text = dateFormatter.string(from: sender.date)
        }
        
    }
    
    @objc func doneClick() {
//        if self.startTime == nil || self.endTime == nil {
//            self.startTime = Date()
//            self.endTime = Date()
//            let dateFormatter = DateFormatter()
//            guard let sTime = self.startTime, let eTime = self.endTime  else { return }
//            let startText = dateFormatter.string(from: sTime)
//            let endText = dateFormatter.string(from: eTime)
//            self.startTimeText.text = startText
//            self.endTimeText.text = endText
//        }
        
        
        self.endEditing(true)
    }
    
}
