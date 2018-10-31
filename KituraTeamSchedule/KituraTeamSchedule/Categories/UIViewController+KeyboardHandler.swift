//
//  UIViewController+KeyboardHandler.swift
//  KituraTeamSchedule
//
//  Created by Dzmitry Tarelkin on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setupHiddingKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //register
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                                               name: Notification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)),
                                               name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    //show
    @objc func keyboardWillShow(notification: Notification) {
    }
    
    //hide
    @objc func keyboardWillHide(notification: Notification) {
    }
    
    //remove observers
    func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
}
