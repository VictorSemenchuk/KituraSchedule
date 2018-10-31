//
//  UINavigationBar.swift
//  KituraTeamSchedule+Gradient
//
//  Created by Viktar Semianchuk on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func setGradientBackground(colors: [UIColor]) {
        
        var updatedFrame = bounds
        updatedFrame.size.height += 2 * self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
        
        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
    }
}
