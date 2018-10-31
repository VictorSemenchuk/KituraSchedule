//
//  ContactTableViewCell.swift
//  HouseKeeper
//
//  Created by Dmitriy Tarelkin on 11/9/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    //MARK:- Properties
    
    @IBOutlet weak var photImageView: UIImageView!
    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var fulnameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    var cellUser: User?
    
    override var isSelected: Bool {
        didSet {
            self.contentView.alpha = isSelected ? 0.3 : 1.0
            self.layer.shadowColor = isSelected ? UIColor.clear.cgColor : UIColor.gray.cgColor
        }
    }
    
    //MARK:- Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        self.photImageView.layer.cornerRadius = self.photImageView.bounds.size.width / 2
        self.photImageView.backgroundColor = UIColor.randomContactColor()
        self.backgroundColor = UIColor(red: 248.0/255.0, green: 252.0/255.0, blue: 254.0/255.0, alpha: 255.0/255.0)
        self.separatorInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        self.selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.resetPhoto()
    }
    
    //MARK: Public
    
    /**
     Configure innner views by certain user.
     
     - parameters:
        - user: Necessary user.
     */
    
    func configureViewWithUser(user: User) {
        self.fulnameLabel.text = user.fullName
        self.shortNameLabel.text = user.initials
        self.userEmailLabel.text = user.email
    }
    
    /**
     Set photo for current contact cell.
     
     - parameters:
     - photo: Necessary photo.
     */
    
    func setPhoto(photo: UIImage?) {
        guard let photo = photo else {
            return
        }
        self.photImageView.image = photo
        self.shortNameLabel.isHidden = true
    }
    
    //MARK: Private
    
    private func resetPhoto() {
        self.photImageView.image = nil
        self.shortNameLabel.isHidden = false
    }
    
}
