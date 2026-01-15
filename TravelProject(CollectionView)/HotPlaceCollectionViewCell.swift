//
//  HotPlaceCollectionViewCell.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/15/26.
//

import UIKit

class HotPlaceCollectionViewCell: UICollectionViewCell {
    @IBOutlet var koreanNameLabel: UILabel!
    @IBOutlet var cityName: UILabel!
    
    @IBOutlet var adMarkLabel: UILabel!
    @IBOutlet var adKoreanName: UILabel!
    
    func configUI(row: TouristSpot) {
        if !row.ad {
            koreanNameLabel.text = row.koreanName
            cityName.text = row.city
        } else {
            adMarkLabel.layer.cornerRadius = adMarkLabel.frame.height / 2
            adKoreanName.text = row.koreanName
        }
    }
}
