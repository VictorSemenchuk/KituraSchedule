//
//  RLTableViewCell.swift
//  KituraTeamSchedule
//
//  Created by User on 10/30/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import UIKit

let kCellId: String = "cellid"

class RLTableViewCell: UITableViewCell {
    
    @IBOutlet weak var detailedView: RLDetailedView!
    @IBOutlet weak var descriptionView: RLDescriptionView!
    @IBOutlet weak var reasonContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reasonContainerView.layer.cornerRadius = 10
        reasonContainerView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.detailedView.dateLable.text = nil
        self.detailedView.dayLable.text = nil
        self.descriptionView.time.text = nil
        self.descriptionView.reason.text = nil
        self.descriptionView.descriptionLabel.text = nil
    }
    
    func fillTheCell(_ dataRow: Record) {
        self.detailedView.dateLable.text = String.string(with: "d", from: dataRow.startDate)
        self.detailedView.dayLable.text = String.string(with: "MMM", from: dataRow.startDate)
        self.descriptionView.time.text = "\(String.string(with: "HH:mm", from: dataRow.startDate)) - \(String.string(with: "HH:mm", from: dataRow.endDate))"
        self.descriptionView.reason.text = dataRow.reason?.title
        self.descriptionView.descriptionLabel.text = dataRow.details
    }
    
    
}
