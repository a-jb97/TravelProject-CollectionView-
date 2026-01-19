//
//  UITextView + Extension.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/20/26.
//

import UIKit

extension UITextView {
    // MARK: 행간 조절
    func setLineSpacing(_ text: String, spacing: CGFloat){
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: attributedString.length))
        
        self.attributedText = attributedString
    }
}
