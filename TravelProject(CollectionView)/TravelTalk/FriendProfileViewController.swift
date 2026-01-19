//
//  FriendProfileViewController.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/19/26.
//

import UIKit
import SnapKit

class FriendProfileViewController: UIViewController {
    let profileImageView = {
        let imageView = UIImageView()
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemBlue
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "person.fill")
        
        return imageView
    }()
    let nicknameLabel = {
        let label = UILabel()
        
        label.text = "닉네임"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    let friendNameLabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 28)
        
        return label
    }()
    
    // MARK: 레이아웃 확정 후 CornerRadius 계산
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Travel Friends"

        [profileImageView, nicknameLabel, friendNameLabel].forEach {
            view.addSubview($0)
        }
        
        configLayout()
    }
    
    private func configLayout() {
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.height.width.equalTo(150)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
        }
        
        friendNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(nicknameLabel.snp.bottom).offset(12)
        }
    }
}
