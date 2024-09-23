//
//  MCButton.swift
//  Mulchat
//
//  Created by Nebo on 17.09.2024.
//

import UIKit
import SnapKit

final class MCButton: UIButton {
    
    override var isHighlighted: Bool {
        willSet(newVal) {
            UIView.animate(withDuration: 0.2, delay: 0) {
                self.transform = newVal ? self.transform.scaledBy(x: 0.95, y: 0.95) : .identity
            }
        }
    }
    
    private lazy var bgImage: UIImageView = {
        let bgImage = UIImageView(image: .init(named: "MCButton"))
        bgImage.contentMode = .scaleAspectFill
        return bgImage
    }()
    
    private lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.isUserInteractionEnabled = false
        bgView.backgroundColor = UIColor.MC.background_4
        return bgView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
        addOuterShadows()
    }
    
    func setTitle(text: String, textColor: UIColor, font: UIFont) {
        let string = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font: font])
        setAttributedTitle(string, for: .normal)
    }
    
    private func setupConstraints() {
        insertSubview(bgView, at: 0)
        insertSubview(bgImage, at: 1)
        
        bgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
