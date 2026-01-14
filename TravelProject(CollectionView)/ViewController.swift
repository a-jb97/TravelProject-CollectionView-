//
//  ViewController.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/14/26.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var travelCollectionView: UICollectionView!
    
    var citys = CityInfo().city
    var filter: Filter = .all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        travelCollectionView.delegate = self
        travelCollectionView.dataSource = self
        
        let xib = UINib(nibName: TravelCollectionViewCell.identifier, bundle: nil)
        
        travelCollectionView.register(xib, forCellWithReuseIdentifier: TravelCollectionViewCell.identifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 140, height: 190)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 4
        
        travelCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: TravelCollectionViewCell.identifier, for: indexPath) as! TravelCollectionViewCell
        
        item.configUI(row: citys[indexPath.row])
        
        return item
    }
    
    @IBAction func filterSCValueChanged(_ sender: UISegmentedControl) {
        
    }
}
