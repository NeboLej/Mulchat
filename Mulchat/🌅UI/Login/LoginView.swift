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


class StarShipView: UIView {
    
    private lazy var views: [UIView] = []
    
    private func createParticles(count: Int) -> [UIView] {
        let views =  (1...count).map { _ in
            let view = UIView()
            view.backgroundColor = UIColor.MC.accent_1
            view.frame = .init(origin: CGPoint(x: .random(in: 0...bounds.maxX), y: .random(in: 0...bounds.maxY)),
                               size: .init(width: 1, height: 1))
            return view
        }
        addSubviews(views)
        return views
    }

    
    func start() {
        views.forEach { 
            $0.layer.removeAllAnimations()
            $0.removeFromSuperview()
        }
        
        views = createParticles(count: 1000)
        
        views.forEach { star in
            UIView.animate(withDuration: 30, delay: .random(in: 0...30), options: [.repeat]) {
                star.center = CGPoint(x: star.center.x, y: self.bounds.maxY + 100)
                star.alpha = 0
                print(star.frame)
            }
        }
    }
}

