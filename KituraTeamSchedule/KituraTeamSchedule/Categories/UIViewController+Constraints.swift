//
//  UIViewController+Constraints.swift
//  KituraTeamSchedule
//
//  Created by Viktar Semianchuk on 10/31/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func applyConstraints(to viewElem: UIView, superViewElem: UIView, withConstants top: CGFloat, leading: CGFloat, trail: CGFloat, bottom: CGFloat) {
        let viewElemIsAdded: Bool = (viewElem.superview != nil) ? true : false
        
        if !viewElemIsAdded {
            superViewElem.addSubview(viewElem)
        }
        let safeArea = superViewElem.safeAreaLayoutGuide
        viewElem.translatesAutoresizingMaskIntoConstraints = false
        
        viewElem.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: top).isActive = true
        viewElem.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leading).isActive = true
        viewElem.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: trail).isActive = true
        viewElem.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: bottom).isActive = true
    }
    
}
