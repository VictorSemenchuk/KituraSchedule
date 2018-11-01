//
//  AddRecordViewController+KayboardHandler.swift
//  KituraTeamSchedule
//
//  Created by Dmitriy Tarelkin on 1/11/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import UIKit

extension RecordViewController {
    
    //show
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
