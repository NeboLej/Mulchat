//
//  TriangleAnimationView.swift
//  Mulchat
//
//  Created by Nebo on 22.09.2024.
//

import UIKit
import SnapKit

final class TriangleAnimationView: UIView {
   
    private lazy var triangles: [TriangleView]  = { (0...10).map { _ in TriangleView() } }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutTriangles(triangles)
        startAnimate(triangles)
    }
    
    private func layoutTriangles(_ views: [TriangleView]) {
        let delta = bounds.width / CGFloat(views.count)
        
        addSubviews(views)
        
        views.enumerated().forEach { index, view in
            view.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(view.snp.height)
                make.left.equalToSuperview().offset((delta * CGFloat(index)) - bounds.height/2)
            }
        }
    }
    
    private func startAnimate(_ views: [TriangleView]) {
        views.enumerated().forEach { index, view  in
            view.alpha = 0.3
            
            UIView.animate(withDuration: 10, delay: 0.6 * Double(index), options: [.autoreverse, .repeat, .curveEaseInOut]) {
                view.transform = view.transform.rotated(by: CGFloat.pi)
            }
        }
    }
}

final class TriangleView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        createTriangleStroke()
    }

    private func createTriangleStroke() {
        
        let drawStrokeShapeLayer = CAShapeLayer()
        drawStrokeShapeLayer.frame = self.bounds
        drawStrokeShapeLayer.fillColor = UIColor.clear.cgColor
        drawStrokeShapeLayer.strokeColor = UIColor.MC.accent_2.cgColor
        drawStrokeShapeLayer.lineWidth = 1
        
        self.layer.insertSublayer(drawStrokeShapeLayer, at: 1)
        
        let path = createPath()
        
        drawStrokeShapeLayer.path = path.cgPath
    }
    
    private func createPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: frame.size.width/2, y: 0))
        
        path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
        path.addLine(to: CGPoint(x: 0, y: frame.size.height))
        path.addLine(to: CGPoint(x: frame.size.width/2, y: 0))
        
        path.close()
        return path
    }
}
