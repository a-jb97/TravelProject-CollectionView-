//
//  ChatListCollectionViewCell.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/16/26.
//

import UIKit
import Kingfisher

class ChatListCollectionViewCell: UICollectionViewCell {
    static let identifier = "ChatListCollectionViewCell"
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var profileImageButton: UIButton!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var timeStampLabel: UILabel!
    
    var buttonTap: (() -> Void)?
    
    func configUI(row: ChatRoom) {
        let user = mockUsers[row.participantIds[1]]
        
        profileImageView.kf.setImage(with: URL(string: user.profileImage))
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        profileImageButton.addTarget(self, action: #selector(profileImageButtonTapped), for: .touchUpInside)
        
        userNameLabel.text = user.userName
        contentLabel.text = row.messages.last?.content
        timeStampLabel.text = chatRoomDateFormat(row.messages.last?.timestamp ?? Date())
    }
    
    @objc private func profileImageButtonTapped() {
        buttonTap?()
    }
}

extension ChatListCollectionViewCell {
    // MARK: DateFormat
    func chatRoomDateFormat(_ date: Date) -> String {
        let format = DateFormatter()
        
        format.dateFormat = "yy.MM.dd"
        
        let result = format.string(from: date)
        
        return result
    }
}
