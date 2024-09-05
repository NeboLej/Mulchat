//
//  UILabel+.swift
//  Mulchat
//
//  Created by Nebo on 27.08.2024.
//

import UIKit

extension UILabel {
    
    convenience init(text: String? = nil, color: UIColor? = nil, font: UIFont? = nil) {
        self.init()
        if let text = text {
            self.text = text
        }
        
        if let color = color {
            self.textColor = color
        }
        
        if let font = font {
            self.font = font
        }
    }
}
