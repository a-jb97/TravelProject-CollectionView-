//
//  FriendMessageTableViewCell.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/17/26.
//

import UIKit
import Kingfisher

class FriendMessageTableViewCell: UITableViewCell {
    static let identifier = "FriendMessageTableViewCell"
    
    @IBOutlet var friendProfileImageView: UIImageView!
    @IBOutlet var bubbleView: UIView!
    @IBOutlet var friendNameLabel: UILabel!
    @IBOutlet var friendMessageLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    func configUI(id: Int, row: Message) {
        let user = mockUsers[id]
        
        friendProfileImageView.contentMode = .scaleAspectFill
        friendProfileImageView.layer.cornerRadius = friendProfileImageView.frame.height / 2
        friendProfileImageView.kf.setImage(with: URL(string: user.profileImage))
        bubbleView.layer.cornerRadius = 10
        bubbleView.layer.borderWidth = 1
        bubbleView.layer.borderColor = UIColor.lightGray.cgColor
        friendNameLabel.text = user.userName
        friendMessageLabel.text = row.content
        timeLabel.text = timeDateFormat(row.timestamp)
    }
}
