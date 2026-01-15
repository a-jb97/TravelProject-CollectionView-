//
//  HotPlaceViewController.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/15/26.
//

import UIKit

class HotPlaceViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    static let identifier = "HotPlaceViewController"
    
    @IBOutlet var hotplaceCollectionView: UICollectionView!
    
    let spots = TouristSpotInfo().spots
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return spots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if !spots[indexPath.row].ad {
            let hotPlaceCell = collectionView.dequeueReusableCell(withReuseIdentifier: HotPlaceCollectionViewCell.identifier, for: indexPath) as! HotPlaceCollectionViewCell
            
            hotPlaceCell.layer.cornerRadius = 15
            hotPlaceCell.configUI(row: spots[indexPath.row])
            
            return hotPlaceCell
        } else {
            let adCell = collectionView.dequeueReusableCell(withReuseIdentifier: AdCollectionViewCell.identifier, for: indexPath) as! AdCollectionViewCell
            
            adCell.layer.cornerRadius = 15
            adCell.layer.borderWidth = 1
            adCell.layer.borderColor = UIColor.orange.cgColor
            adCell.configUI(row: spots[indexPath.row])
            
            return adCell
        }
    }
    
    // MARK: collectionView 레이아웃
    private func configCollectionView() {
        hotplaceCollectionView.delegate = self
        hotplaceCollectionView.dataSource = self
        
        let hotPlaceXib = UINib(nibName: HotPlaceCollectionViewCell.identifier, bundle: nil)
        let adXib = UINib(nibName: AdCollectionViewCell.identifier, bundle: nil)
        
        hotplaceCollectionView.register(hotPlaceXib, forCellWithReuseIdentifier: HotPlaceCollectionViewCell.identifier)
        hotplaceCollectionView.register(adXib, forCellWithReuseIdentifier: AdCollectionViewCell.identifier)
        
        let inset: CGFloat = 4
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.itemSize = CGSize(width: width / 3.4, height: width / 4.5)
        
        hotplaceCollectionView.collectionViewLayout = layout
    }
}
