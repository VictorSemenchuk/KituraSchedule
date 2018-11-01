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

extension RecordViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
            self.reasonCollectionView.reloadData()
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

        cell.configureCellWithReason(reason: reason)
        cell.setAlphaComponentIfCellIsupdated(with: self.record)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ReasonCollectionViewCell
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let reasons = self.reasons else { return }
        let reason = reasons[indexPath.row]
        
        collectionView.visibleCells.forEach { cell in
            if let newCell = cell as? ReasonCollectionViewCell {
                newCell.reasonTitleLabel.alpha = 0.2
            }
        }
        
        cell?.reasonTitleLabel.alpha = 1
        self.record?.reason = reason
        self.record?.reasonId = reason.reasonId
        self.newRecord?.reasonId = reason.reasonId
        self.newRecord?.reason = reason
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var size = CGSize(width: 60, height: 80)
        guard let reasons = self.reasons else {
            return size
        }
        
        size.width = (collectionView.bounds.width - 20) / CGFloat(reasons.count)
        return size
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 16
    }
    
    
}
