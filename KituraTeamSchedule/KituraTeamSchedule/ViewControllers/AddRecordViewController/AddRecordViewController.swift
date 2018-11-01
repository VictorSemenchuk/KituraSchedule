//
//  AddrecordVC.swift
//  KituraTeamSchedule
//
//  Created by User on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
    
//    @IBOutlet weak var scrollView: UIScrollView!
//    //@IBOutlet weak var contentView: UIView!
//    @IBOutlet weak var reasonCollectionView: UICollectionView!
//    @IBOutlet weak var dateSetter: KPIDateSetter!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var reasonCollectionView: UICollectionView!
    @IBOutlet weak var dateSetterView: KPIDateSetter!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var record: Record?
    var reasons: [Reason]?
    
    
    //MARK: - ViewController lifecycle
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.blue
        //self.descriptionTextView.layer.borderWidth = 1
        //self.descriptionTextView.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.contentView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(endEditingTextView(_:))))
//        self.descriptionTextView.delegate = self
        
        //configure collectionView
        self.configureCollectionView()
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
        
    }
    
    
//    @objc func endEditingTextView(_ sender: UITextView) {
//        self.view.endEditing(false)
//    }
    
    
    @objc override func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height - 40, right: 0)
        self.scrollView.contentInset = contentInset
    }
    
    //hide
    @objc override func keyboardWillHide(notification: Notification) {
        self.scrollView.contentInset = UIEdgeInsets.zero
    }
    
}




extension RecordViewController: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            self.view.endEditing(true)
            return false
        }
        return true
    }
    
}








