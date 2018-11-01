//
//  ReasonCollectionViewCell.swift
//  KituraTeamSchedule
//
//  Created by Dmitriy Tarelkin on 1/11/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

class ReasonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var reasonTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.layer.cornerRadius = 8
    }
    
    func configureCellWithReason(reason:Reason) {
        self.reasonTitleLabel.text = reason.title
        
        guard let color = reason.color else {
            return
        }
        
        self.reasonTitleLabel.backgroundColor = UIColor.init(red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(color.blue), alpha: CGFloat(color.alpha))
    }
}