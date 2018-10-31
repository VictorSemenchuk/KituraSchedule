//
//  AddrecordVC.swift
//  KituraTeamSchedule
//
//  Created by User on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

class AddRecordViewController: UIViewController {
    
//    @IBOutlet weak var scrollView: UIScrollView!
//    //@IBOutlet weak var contentView: UIView!
//    @IBOutlet weak var reasonCollectionView: UICollectionView!
//    @IBOutlet weak var dateSetter: KPIDateSetter!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var reasonCollectionView: UICollectionView!
    @IBOutlet weak var dateSetterView: KPIDateSetter!
    @IBOutlet weak var detailsTextField: UITextField!
    //@IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var constraintContentHeight: NSLayoutConstraint!
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.blue
//        self.reasonCollectionView.backgroundColor = UIColor.lightGray
        //self.descriptionTextView.layer.borderWidth = 1
        //self.descriptionTextView.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        //self.contentView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(endEditingTextView(_:))))
        //self.descriptionTextView.delegate = self
    }
    
    @objc func endEditingTextView(_ sender: UITextView) {
        self.view.endEditing(true)
    }
    
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

extension AddRecordViewController: UITextViewDelegate {
    
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








