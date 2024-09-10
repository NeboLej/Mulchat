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
    }
    
    private func drawFillShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.fillColor = UIColor.MC.glass.cgColor

        self.layer.insertSublayer(shapeLayer, at: 0)
        
        let path = createPath()
        
        shapeLayer.path = path.cgPath
    }
    
    private func drawStrokeShape() {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.MC.accent_2.cgColor
        shapeLayer.lineWidth = 3
        
        self.layer.insertSublayer(shapeLayer, at: 1)
        
        let path = createPath()
        
        shapeLayer.path = path.cgPath
    }
    
    private func createPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))

        
        path.addLine(to: CGPoint(x: self.frame.size.width/2, y: 8))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
        
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        path.addLine(to: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height - 8))
        path.addLine(to: CGPoint(x: 0, y: self.frame.size.height))
        
        path.close()
        return path
    }
    
}
