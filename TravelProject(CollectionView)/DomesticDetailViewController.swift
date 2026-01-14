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
    
    var itemData: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    @IBAction func otherCityButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    private func configUI() {
        let url = itemData?.city_image
        cityImageView.clipsToBounds = true
        cityImageView.layer.cornerRadius = cityImageView.frame.height / 2
        cityImageView.kf.setImage(with: URL(string: url ?? ""))
        
        cityNameLabel.text = "\(itemData?.city_name ?? "") | \(itemData?.city_english_name ?? "")"
        
        cityExplainLabel.text = itemData?.city_explain ?? ""
    }
}
