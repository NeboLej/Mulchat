//
//  MCSegmentControll.swift
//  Mulchat
//
//  Created by Nebo on 11.09.2024.
//

import UIKit

final class MCSegmentControl: UISegmentedControl {
    
    private let segmentInset: CGFloat = 2
    private lazy var segmentImage: UIImage? = UIImage(color: selectedSegmentTintColor ?? .white)

    override func layoutSubviews(){
        super.layoutSubviews()

        //background
        layer.cornerRadius = bounds.height/2
        //foreground
        let foregroundIndex = numberOfSegments
        if subviews.indices.contains(foregroundIndex), let foregroundImageView = subviews[foregroundIndex] as? UIImageView
        {
            foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
            foregroundImageView.image = segmentImage
            foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")
            foregroundImageView.layer.masksToBounds = true
            foregroundImageView.layer.cornerRadius = foregroundImageView.bounds.height/2
        }
    }
}
