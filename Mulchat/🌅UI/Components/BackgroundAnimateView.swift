//
//  BackgroundAnimateView.swift
//  Mulchat
//
//  Created by Nebo on 05.09.2024.
//

import UIKit

final class BackgroundAnimateView: UIView {
    
    private lazy var views: [UIView] = []
    
    override func layoutSubviews() {
        super.layoutSubviews()
        start()
    }
    
    private func start() {
        views.forEach {
            $0.layer.removeAllAnimations()
            $0.removeFromSuperview()
        }
        
        views = createParticles(count: 1000)
        
        views.forEach { star in
            UIView.animate(withDuration: 30, delay: .random(in: 0...30), options: [.repeat]) {
                star.center = CGPoint(x: star.center.x, y: self.bounds.maxY + 100)
                star.alpha = 0
            }
        }
    }
    
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
}

