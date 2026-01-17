//
//  FriendMessageTableViewCell.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/17/26.
//

import UIKit
import Kingfisher

class FriendMessageTableViewCell: UITableViewCell {
    @IBOutlet var friendProfileImageView: UIImageView!
    @IBOutlet var friendNameLabel: UILabel!
    @IBOutlet var friendMessageLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    func configUI(id: Int, row: Message) {
        let user = mockUsers[id]
        
        friendProfileImageView.kf.setImage(with: URL(string: user.profileImage))
        friendNameLabel.text = user.userName
        friendMessageLabel.text = row.content
        timeLabel.text = timeDateFormat(row.timestamp)
    }
}
