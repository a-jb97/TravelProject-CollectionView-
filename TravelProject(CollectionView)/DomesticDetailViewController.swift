//
//  DomesticDetailViewController.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/14/26.
//

import UIKit
import Kingfisher

class DomesticDetailViewController: UIViewController {
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    @IBOutlet var otherCityButton: UIButton!
    
    var itemData: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        
        otherCityButton.addTarget(self, action: #selector(otherCityButtonTapped), for: .touchUpInside)
    }
    
    @objc private func otherCityButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func configUI() {
        navigationItem.title = "관광지 화면"
        
        let url = itemData?.city_image
        cityImageView.clipsToBounds = true
        cityImageView.layer.cornerRadius = cityImageView.frame.height / 2
        cityImageView.kf.setImage(with: URL(string: url ?? ""))
        
        cityNameLabel.text = "\(itemData?.city_name ?? "") | \(itemData?.city_english_name ?? "")"
        
        cityExplainLabel.text = itemData?.city_explain
    }
}
