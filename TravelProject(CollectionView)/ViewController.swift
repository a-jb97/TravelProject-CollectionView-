//
//  ViewController.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/14/26.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var filterSegmentedControl: UISegmentedControl!
    @IBOutlet var travelCollectionView: UICollectionView!
    
    var citys = CityInfo().city
    var filter: Filter = .all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "flame.fill"), style: .plain, target: self, action: #selector(leftBarButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .systemOrange
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
        
        filterSegmentedControl.addTarget(self, action: #selector(filterSegmentedControlTapped), for: .valueChanged)
        
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
    
    @objc private func leftBarButtonTapped() {
        
    }
    
    @objc private func rightBarButtonTapped() {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: TravelCollectionViewCell.identifier, for: indexPath) as! TravelCollectionViewCell
        
        item.configUI(row: citys[indexPath.row])
        
        return item
    }
    
    // MARK: 아이템 선택 시 조건부로 각 DetailVC로 Push 또는 Present
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let domesticVC = storyboard?.instantiateViewController(withIdentifier: "DomesticDetailViewController") as! DomesticDetailViewController
        
        let internationalVC = storyboard?.instantiateViewController(withIdentifier: "InternationalDetailViewController") as! InternationalDetailViewController
        
        if citys[indexPath.row].domestic_travel {
            domesticVC.itemData = citys[indexPath.row]
            
            navigationController?.pushViewController(domesticVC, animated: true)
        } else {
            let navVC = UINavigationController(rootViewController: internationalVC)
            
            internationalVC.itemData = citys[indexPath.row]
            navVC.modalPresentationStyle = .fullScreen
            
            present(navVC, animated: true)
        }
    }
    
    // MARK: Enum을 이용하여 SegmentedControl로 필터링
    @objc private func filterSegmentedControlTapped(_ sender: UISegmentedControl) {
        let selectedSeg = sender.selectedSegmentIndex
        let selectedOption = Filter(rawValue: sender.titleForSegment(at: selectedSeg)!)!
        
        switch selectedOption {
        case .all:
            citys = CityInfo().city
            travelCollectionView.reloadData()
        case .domestic:
            citys = CityInfo().domesticCities
            travelCollectionView.reloadData()
        case .international:
            citys = CityInfo().internationalCities
            travelCollectionView.reloadData()
        }
    }
}
