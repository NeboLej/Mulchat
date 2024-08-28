//
//  UILabel+.swift
//  Mulchat
//
//  Created by Nebo on 27.08.2024.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, color: UIColor, font: UIFont) {
        self.init()
        self.text = text
        self.textColor = color
        self.font = font
    }
}
