//
//  HotPlaceCollectionViewCell.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/15/26.
//

import UIKit

class HotPlaceCollectionViewCell: UICollectionViewCell {
    static let identifier = "HotPlaceCollectionViewCell"
    
    @IBOutlet var koreanNameLabel: UILabel!
    @IBOutlet var cityName: UILabel!
    
    func configUI(row: TouristSpot) {
        koreanNameLabel.text = row.koreanName
        cityName.text = row.city
        self.layer.cornerRadius = 15
    }
}
