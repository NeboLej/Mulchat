//
//  Fonts.swift
//  Mulchat
//
//  Created by Nebo on 27.08.2024.
//

import UIKit

extension UIFont {
    
    enum MCFont: String {
        case ubuntuLight = "Ubuntu-Light"
        case ubuntuMedium = "Ubuntu-Medium"
        case ubuntuRegular = "Ubuntu-Regular"
        case ubuntuBold = "Ubuntu-Bold"
    }
    
    static func get(type: MCFont, size: CGFloat) -> UIFont {
        UIFont(name: type.rawValue, size: size)!
    }
}
