//
//  UIView+Shake.swift
//  KituraTeamSchedule
//
//  Created by Dzmitry Tarelkin on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     Shaking animation for view. Usually using with some input data validation.
     */
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 5.0, y: center.y))
        animation.toValue   = NSValue(cgPoint: CGPoint(x: center.x + 5.0, y: center.y))
        
        layer.add(animation, forKey: "position")
        layer.borderColor = UIColor.red.cgColor
    }
    
}

