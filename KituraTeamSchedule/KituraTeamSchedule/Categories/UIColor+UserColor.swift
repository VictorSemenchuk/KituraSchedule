//
//  UIColor+UserColor.swift
//  KituraTeamSchedule
//
//  Created by Dzmitry Tarelkin on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static let HKGreen  = UIColor(red: 76.0/255.0,  green: 217.0/255.0, blue: 100.0/255.0, alpha: 1.0)
    static let HKBlue   = UIColor(red: 90.0/255.0,  green: 200.0/255.0, blue:250.0/255.0,  alpha: 1.0)
    static let HKOrange = UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0,         alpha: 1.0)
    
    /**
     Gitting random color from certain list of colors
     */
    
    class func randomContactColor() -> UIColor {
        let arrayWithColors = [UIColor.HKBlue, UIColor.HKGreen, UIColor.HKOrange]
        let index = arc4random_uniform(UInt32(arrayWithColors.count))
        return arrayWithColors[Int(index)]
    }
    
}
