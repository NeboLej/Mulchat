//
//  GradientView.swift
//  Mulchat
//
//  Created by Nebo on 27.08.2024.
//

import UIKit

final class GradientView: UIView {
    
    enum GradientDirection {
        case leftToRight
        case topToBottom
        case custom(start: CGPoint, end: CGPoint)
    }
    
    var gradientDirection: GradientDirection = .topToBottom
    private var colors: [CGColor] = []
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    func setColors(colors: [UIColor]) {
        self.colors = colors.count == 1 ? [colors[0].cgColor, colors[0].cgColor] : colors.map { $0.cgColor }
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = colors
        
        switch gradientDirection {
        case .leftToRight:
            (layer as! CAGradientLayer).startPoint = .init(x: 0, y: 0.5)
            (layer as! CAGradientLayer).endPoint = .init(x: 1, y: 0.5)
        case .topToBottom:
            (layer as! CAGradientLayer).startPoint = .init(x: 0.5, y: 0)
            (layer as! CAGradientLayer).endPoint = .init(x: 0.5, y: 1)
        case .custom(let start, let end):
            (layer as! CAGradientLayer).startPoint = start
            (layer as! CAGradientLayer).endPoint = end
        }
    }
}
