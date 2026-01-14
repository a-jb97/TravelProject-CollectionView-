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
    
    var itemData: City?

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }
    
    private func configUI() {
        let url = itemData?.city_image
        cityImageView.clipsToBounds = true
        cityImageView.layer.cornerRadius = cityImageView.frame.height / 2
        cityImageView.kf.setImage(with: URL(string: url ?? ""))
        
        cityName.text = "\(itemData?.city_name ?? "") | \(itemData?.city_english_name ?? "")"
        
        cityExplainLabel.text = itemData?.city_explain ?? ""
    }
}
