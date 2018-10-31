//
//  UItextField+Appearance.swift
//  KituraTeamSchedule
//
//  Created by Viktar Semianchuk on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    open override func awakeFromNib() {
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 8
        
        self.setLeftPadding(value: 10)
    }
    
    /**
     Setting left padding for textField
     
     - parameters:
     - value: Width of the padding.
     */
    
    func setLeftPadding(value: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: value, height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }
}
