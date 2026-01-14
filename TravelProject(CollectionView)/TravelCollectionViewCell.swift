//
//  TravelCollectionViewCell.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/14/26.
//

import UIKit
import Kingfisher

class TravelCollectionViewCell: UICollectionViewCell {
    static let identifier = "TravelCollectionViewCell"

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    func configUI(row: City) {
        let url = row.city_image
        cityImageView.clipsToBounds = true
        cityImageView.layer.cornerRadius = cityImageView.frame.height / 2
        cityImageView.kf.setImage(with: URL(string: url))
        cityImageView.contentMode = .scaleAspectFill
        
        cityNameLabel.text = "\(row.city_name) | \(row.city_english_name)"
        
        cityExplainLabel.text = row.city_explain
    }
}
