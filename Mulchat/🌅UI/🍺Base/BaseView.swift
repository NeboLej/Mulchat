//
//  BaseView.swift
//  Mulchat
//
//  Created by Nebo on 26.08.2024.
//

import UIKit

class BaseView: UIView {
    
    init() {
        super.init(frame: .zero)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }
    
    //for override
    func setupConstraints() {}
}
