//
//  InternationalDetailViewController.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/14/26.
//

import UIKit

class InternationalDetailViewController: UIViewController {
    @IBOutlet var cityNameLabel: UILabel!
    
    var itemData: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(leftBarButtonItemTapped))

        cityNameLabel.text = "해외 명소 : \(itemData?.city_name ?? "오류") | \(itemData?.city_english_name ?? "오류")"
    }
    
    @objc private func leftBarButtonItemTapped() {
        dismiss(animated: true)
    }
}
