//
//  UITableViewCell + Extension.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/17/26.
//

import UIKit

extension UITableViewCell {
    // MARK: DateFormat
    func timeDateFormat(_ date: Date) -> String {
        let format = DateFormatter()
        
        format.dateFormat = "HH:mm a"
        
        let result = format.string(from: date)
        
        return result
    }
}
