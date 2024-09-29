//
//  InsetsTextField.swift
//  Mulchat
//
//  Created by Nebo on 05.09.2024.
//

import UIKit

class InsetsTextField: UITextField {
    public var textInsets: UIEdgeInsets {
        didSet {
            setNeedsDisplay()
        }
    }
    
    init(textInsets: UIEdgeInsets) {
        self.textInsets = textInsets
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
}
