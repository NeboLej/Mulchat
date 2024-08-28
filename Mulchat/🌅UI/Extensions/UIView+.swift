//
//  UIView+.swift
//  Mulchat
//
//  Created by Nebo on 27.08.2024.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}

