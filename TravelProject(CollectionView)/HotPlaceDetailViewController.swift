//
//  HotPlaceDetailViewController.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/19/26.
//

import UIKit
import SnapKit
import MapKit

class HotPlaceDetailViewController: UIViewController {
    let hotPlaceMapView = {
        let mapView = MKMapView()
        
        mapView.clipsToBounds = true
        mapView.layer.cornerRadius = 15
        
        return mapView
    }()
    
    let backgroundView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    let placeImageView = setImageView(imageName: "globe")
    let cityImageView = setImageView(imageName: "info.circle")
    let addressImageView = setImageView(imageName: "map")
    let phoneImageView = setImageView(imageName: "phone.fill")
    let linkImageView = setImageView(imageName: "safari")
    let coordinatesImageView = setImageView(imageName: "arrow.up.right.circle")
    
    let infoTextView = {
        let textView = UITextView()
        
        textView.backgroundColor = .clear
        textView.dataDetectorTypes = [.link, .phoneNumber]
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = true
        textView.font = .systemFont(ofSize: 15)
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background

        [hotPlaceMapView, backgroundView, placeImageView, cityImageView, addressImageView, phoneImageView, linkImageView, coordinatesImageView, infoTextView].forEach { view.addSubview($0) }
        
        configLayout()
    }
    
    private func configLayout() {
        hotPlaceMapView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(250)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(hotPlaceMapView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalTo(coordinatesImageView.snp.bottom).offset(8)
        }
        
        placeImageView.snp.makeConstraints { make in
            make.top.leading.equalTo(backgroundView).offset(8)
        }
        
        cityImageView.snp.makeConstraints { make in
            make.top.equalTo(placeImageView.snp.bottom).offset(8)
            make.leading.equalTo(backgroundView).offset(8)
        }
        
        addressImageView.snp.makeConstraints { make in
            make.top.equalTo(cityImageView.snp.bottom).offset(8)
            make.leading.equalTo(backgroundView).offset(8)
        }
        
        phoneImageView.snp.makeConstraints { make in
            make.top.equalTo(addressImageView.snp.bottom).offset(8)
            make.leading.equalTo(backgroundView).offset(8)
        }
        
        linkImageView.snp.makeConstraints { make in
            make.top.equalTo(phoneImageView.snp.bottom).offset(8)
            make.leading.equalTo(backgroundView).offset(8)
        }
        
        coordinatesImageView.snp.makeConstraints { make in
            make.top.equalTo(linkImageView.snp.bottom).offset(8)
            make.leading.equalTo(backgroundView).offset(8)
        }
        
        infoTextView.snp.makeConstraints { make in
            make.top.bottom.equalTo(backgroundView).offset(4)
            make.leading.equalTo(placeImageView.snp.trailing).offset(4)
            make.trailing.equalTo(backgroundView.snp.trailing).inset(8)
        }
    }
    
    
    
    static private func setImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: imageName)
        imageView.tintColor = .systemBlue
        
        return imageView
    }
    
    static private func setLabel() -> UILabel {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.text = "서울특별시 송파구"
        
        return label
    }
}
