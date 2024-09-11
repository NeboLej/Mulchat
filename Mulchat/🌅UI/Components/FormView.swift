//
//  FormView.swift
//  Mulchat
//
//  Created by Nebo on 09.09.2024.
//

import UIKit

final class FormView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawFillShape()
        drawStrokeShape()
        
        startAnimation()
    }
    
    func onFocus() {
        startAnimation()
    }
    
    private func startAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeColor")
        animation.duration = 0.2
        animation.beginTime = CACurrentMediaTime() + 2
        animation.fromValue = UIColor.MC.accent_2.withAlphaComponent(0.2).cgColor
        animation.toValue = UIColor.MC.accent_2.cgColor
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.repeatCount = 2

        drawStrokeShapeLayer?.add(animation, forKey: "loadingAnimation")
    }
    
    private func drawFillShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.fillColor = UIColor.MC.glass.cgColor

        self.layer.insertSublayer(shapeLayer, at: 0)
        
        let path = createPath()
        
        shapeLayer.path = path.cgPath
    }
    
    var drawStrokeShapeLayer: CAShapeLayer?
    
    private func drawStrokeShape() {
        
        drawStrokeShapeLayer = CAShapeLayer()
        
        guard let drawStrokeShapeLayer else { return }
        drawStrokeShapeLayer.frame = self.bounds
        drawStrokeShapeLayer.fillColor = UIColor.clear.cgColor
        drawStrokeShapeLayer.strokeColor = UIColor.MC.accent_2.cgColor
        drawStrokeShapeLayer.lineWidth = 3
        
        self.layer.insertSublayer(drawStrokeShapeLayer, at: 1)
        
        let path = createPath()
        
        drawStrokeShapeLayer.path = path.cgPath
    }
    
    private func createPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))

        
        path.addLine(to: CGPoint(x: frame.size.width/2, y: 8))
        path.addLine(to: CGPoint(x: frame.size.width, y: 0))
        
        path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
        
        path.addLine(to: CGPoint(x: frame.size.width/2, y: frame.size.height - 8))
        path.addLine(to: CGPoint(x: 0, y: frame.size.height))
        
        path.close()
        return path
    }
    
}
