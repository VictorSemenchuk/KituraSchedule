//
//  AddRecodViewController+CollectionView.swift
//  KituraTeamSchedule
//
//  Created by Dmitriy Tarelkin on 1/11/18.
//  Copyright © 2018 KituraTeam. All rights reserved.
//

import Foundation
import UIKit

fileprivate let kReasonCollectionViewCellIdentifier = "ReasonCoolectionViewCellIdentifier"
fileprivate let kReasonCollectionViewCellNibName    = "ReasonCollectionViewCell"

extension RecordViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //configure collection view
    func configureCollectionView() {
        self.reasonCollectionView.dataSource = self
        self.reasonCollectionView.delegate   = self
        self.reasonCollectionView.register(UINib.init(nibName: kReasonCollectionViewCellNibName, bundle: Bundle.main), forCellWithReuseIdentifier: kReasonCollectionViewCellIdentifier)
        
        //load reasons
        Service.getReasons { (reasons, error) in
            guard let reasons = reasons else {
                self.showAlertWithTitle("Error", message: error?.localizedDescription)
                return
            }
            self.reasons = reasons
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let reasons = self.reasons else {
            return 0
        }
        return reasons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: kReasonCollectionViewCellIdentifier, for: indexPath) as? ReasonCollectionViewCell,
            let reasons = self.reasons else { return ReasonCollectionViewCell() }

        let reason = reasons[indexPath.row]

//        cell.configureCellWith(reason: reason)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ReasonCollectionViewCell
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let reasons = self.reasons else { return }
        let reason = reasons[indexPath.row]
        
        //Record.reason = reason
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width - 32.0, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let insets = UIEdgeInsets(top: kCollectionViewTopBottomPadding,
//                                  left: kMainLeftRightPadding,
//                                  bottom: kCollectionViewTopBottomPadding,
//                                  right: kMainLeftRightPadding)
        let insets = UIEdgeInsets(top: 0,
                                  left: 0,
                                  bottom: 0,
                                  right: 0)
        return insets
    }
    
    
}
