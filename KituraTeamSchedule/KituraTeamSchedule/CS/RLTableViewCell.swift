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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.detailedView.dateLable.text = nil
        self.detailedView.dayLable.text = nil
        self.descriptionView.time.text = nil
        self.descriptionView.reason.text = nil
        self.descriptionView.descriptionLabel.text = nil
    }
    
    func fillTheCell(_ dataRow: [String:String]) {
        self.detailedView.dateLable.text = dataRow["date"]
        self.detailedView.dayLable.text = dataRow["day"]
        self.descriptionView.time.text = dataRow["time"]
        self.descriptionView.reason.text = dataRow["reason"]
        self.descriptionView.descriptionLabel.text = dataRow["descr"]
    }
    
    
}
