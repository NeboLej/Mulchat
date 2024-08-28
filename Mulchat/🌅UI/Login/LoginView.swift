//
//  LoginView.swift
//  Mulchat
//
//  Created by Nebo on 26.08.2024.
//

import UIKit
import SnapKit

final class LoginView: BaseView {
    
    private lazy var backgroundGradientView: GradientView  = {
        let view = GradientView()
        view.setColors(colors: [.MC.background_2, .MC.accent_1])
        return view
    }()
  
    private lazy var firstHalfTitleLab: UILabel = {
        let label = UILabel(text: "MUL", color: UIColor.MC.textLight, font: .get(type: .ubuntuRegular, size: 40))
        label.textAlignment = .right
        return label
    }()
    
    private lazy var secondHalfTitleLab: UILabel = {
        let label = UILabel(text: "CHAT", color: UIColor.MC.textLight, font: .get(type: .ubuntuRegular, size: 40))
        label.textAlignment = .left
        return label
    }()
    
    lazy var stars = StarShipView()
    
    override func setupConstraints() {
        super.setupConstraints()
        
        addSubviews([backgroundGradientView, stars, firstHalfTitleLab, secondHalfTitleLab])
        
        backgroundGradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stars.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        firstHalfTitleLab.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            make.right.equalTo(snp.centerX).offset(16)
        }
        
        secondHalfTitleLab.snp.makeConstraints { make in
            make.top.equalTo(firstHalfTitleLab.snp.bottom).offset(-4)
            make.left.equalTo(snp.centerX).offset(-33)
        }
    }
}


class Particle {
    let startPoint: CGPoint
    let color: UIColor
    
    init(startPoint: CGPoint, color: UIColor) {
        self.startPoint = startPoint
        self.color = color
    }
}

class StarShipView: UIView {
    
    private var views: [UIView] = []
    
    func start() {
        
        views.forEach {
            $0.removeFromSuperview()
            $0.layer.removeAllAnimations() }
        
        let particles = (1...1000).map { _ in Particle(startPoint: .init(x: .random(in: 0...bounds.maxX), y: .random(in: 0...bounds.maxY)),
                                                  color: UIColor.MC.accent_1 )}
        
//        let particles = (1...10000).map { _ in Particle(startPoint: .init(x: .random(in: (bounds.midX - 30)...(bounds.midX + 30)),
//                                                                     y: .random(in: (bounds.midY - 30)...(bounds.midY + 30))),
//                                                   color: .white) }
        views = particles.map {
            let view = UIView()
            view.isHidden = true
            view.backgroundColor = $0.color
            view.frame = .init(origin: $0.startPoint, size: .init(width: 1, height: 1))
            return view
        }
        
        addSubviews(views)
        
        views.forEach { star in
            UIView.animate(withDuration: 30, delay: .random(in: 0...30), options: [.repeat]) {
                star.isHidden = false
                star.center = self.getEndPoint(startPoint: star.center)
                star.alpha = 0
            }
        }
    }
    
    func getEndPoint(startPoint: CGPoint) -> CGPoint {
        CGPoint(x: startPoint.x, y: bounds.maxY + 100)
//        CGPoint(x: .random(in: (bounds.minX...bounds.maxX)), y: bounds.maxY + 10)
    }
}
