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
        self.reasonTitleLabel.layer.cornerRadius = 20
        self.reasonTitleLabel.clipsToBounds = true
    }
    
    func configureCellWithReason(reason:Reason) {
        self.reasonTitleLabel.text = reason.title
        
        guard let color = reason.color else {
            return
        }
        
        self.reasonTitleLabel.backgroundColor = UIColor.init(red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(color.blue), alpha: CGFloat(color.alpha))
    }
    
    func setAlphaComponentIfCellIsupdated(with passedRecord: Record?) {
        if let validReason = passedRecord?.reason {
            if self.reasonTitleLabel.text != validReason.title {
                self.reasonTitleLabel.alpha = 0.2
            }
            print("ReasonLBL == \(self.reasonTitleLabel.text!) \(validReason.title)")
        }
    }
}
