//
//  AdCollectionViewCell.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/15/26.
//

import UIKit

class AdCollectionViewCell: UICollectionViewCell {
    static let identifier = "AdCollectionViewCell"
    
    @IBOutlet var adMarkLabel: UILabel!
    @IBOutlet var adKoreanNameLabel: UILabel!
    
    func configUI(row: TouristSpot) {
        adMarkLabel.clipsToBounds = true
        adMarkLabel.layer.cornerRadius = adMarkLabel.frame.height / 2
        adKoreanNameLabel.text = row.koreanName
    }
}
