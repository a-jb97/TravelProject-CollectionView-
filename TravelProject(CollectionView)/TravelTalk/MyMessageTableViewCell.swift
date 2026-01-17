//
//  MyMessageTableViewCell.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/17/26.
//

import UIKit

class MyMessageTableViewCell: UITableViewCell {
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var myMessageLabel: UILabel!
    
    func configUI(row: Message) {
        timeLabel.text = timeDateFormat(row.timestamp)
        myMessageLabel.text = row.content
    }
}
