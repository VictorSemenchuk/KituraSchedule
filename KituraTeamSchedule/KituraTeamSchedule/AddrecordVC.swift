//
//  AddrecordVC.swift
//  KituraTeamSchedule
//
//  Created by User on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

class AddrecordVC: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var reasonCollectionView: UICollectionView!
    @IBOutlet weak var dateSetter: KPIDateSetter!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var constraintContentHeight: NSLayoutConstraint!
    var lastOffset: CGPoint?
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.blue
        self.reasonCollectionView.backgroundColor = UIColor.lightGray
        self.descriptionTextView.layer.borderWidth = 1
        self.descriptionTextView.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        self.contentView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(endEditingTextView(_:))))
        self.descriptionTextView.delegate = self
        
    }
    
    @objc func endEditingTextView(_ sender: UITextView) {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            UIView.animate(withDuration: 0.3, animations: {
                self.constraintContentHeight.constant += keyboardSize.height
            })
            
            let textViewFrame = self.descriptionTextView.frame
            let distanceToBottom = self.scrollView.frame.size.height - (textViewFrame.origin.y + textViewFrame.height)
            let collapseSpace = keyboardSize.height - distanceToBottom
            
            if collapseSpace < 0 {
                return
            }
            
            // set new offset for scroll view
            UIView.animate(withDuration: 0.3, animations: {
                // scroll to the position above keyboard 60 points
                self.scrollView.contentOffset = CGPoint(x: (self.lastOffset?.x)!, y: collapseSpace + 30)
            })
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            if let keboardHeight = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.height {
                
            self.constraintContentHeight.constant -= keboardHeight
            self.scrollView.contentOffset = self.lastOffset!
            }
        }
    }
    
    @IBAction func saveAndPopUp(_ sender: Any) {
        
    }
    
}

extension AddrecordVC: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        self.lastOffset = self.scrollView.contentOffset
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








