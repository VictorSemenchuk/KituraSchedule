//
//  UIVew+Animation.swift
//  KituraTeamSchedule
//
//  Created by Dmitriy Tarelkin on 30/10/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    /**
     Animates button using it's bounds
     
     - parameters:
     - button: Button that will be animated
     - duration: Duaration of animation
     - additionalCompletion: Optioanl block with additional actions to animate
     - finishCompletion: Block with actions that preforms after animation
     
     Additional completion block may be nil if no additional actions to animate
     */
    
    static func animateButton(button: UIButton, duration: TimeInterval, additionalCompletion: (()->())?, finishCompletion: @escaping(()->())) {
        let buttonFrame = button.frame

        UIView.animate(withDuration: duration, animations: {
            
            button.layer.cornerRadius = button.bounds.height / 2
            button.frame = CGRect(x: button.frame.width / 2,
                                  y: button.frame.origin.y,
                                  width: 0,
                                  height: button.frame.height)
            button.alpha = 0
            if let completion = additionalCompletion {
                completion()
            }
            
        }, completion: { (finished) in
            if finished {
                finishCompletion()
            }
        })
    }
}
