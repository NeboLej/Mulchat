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
    
    init() {
        super.init(frame: .zero)
        drawButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawButton() {
        
        let bgImage = UIImageView(image: .init(named: "MCButton"))
        insertSubview(bgImage, at: 0)
        bgImage.contentMode = .scaleAspectFill
        
        let bgView = UIView()
        bgView.isUserInteractionEnabled = false
        bgView.backgroundColor = UIColor.MC.background_4
        insertSubview(bgView, at: 0)
        
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
