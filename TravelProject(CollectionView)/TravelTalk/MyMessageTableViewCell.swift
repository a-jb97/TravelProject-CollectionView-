//
//  MyMessageTableViewCell.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/17/26.
//

import UIKit

class MyMessageTableViewCell: UITableViewCell {
    static let identifier = "MyMessageTableViewCell"
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var myMessageLabel: UILabel!
    @IBOutlet var bubbleView: UIView!
    
    func configUI(row: Message) {
        bubbleView.layer.cornerRadius = 10
        bubbleView.layer.borderWidth = 1
        bubbleView.layer.borderColor = UIColor.lightGray.cgColor
        
        timeLabel.text = timeDateFormat(row.timestamp)
        
        myMessageLabel.text = row.content
    }
}
