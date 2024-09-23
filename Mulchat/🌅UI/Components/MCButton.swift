//
//  MCButton.swift
//  Mulchat
//
//  Created by Nebo on 17.09.2024.
//

import UIKit
import RxSwift
import SnapKit

final class MCButton: UIButton {
    
    private var dispBag = DisposeBag()
    
    init() {
        super.init(frame: .zero)
        drawButton()
        
        rx.tap.throttle(.seconds(2), scheduler: MainScheduler.instance)
            .bind(onNext: { [weak self] in self?.onClickAnimate() })
            .disposed(by: dispBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawButton() {

        let firstImage = UIImageView(image: .init(named: "MCButton"))
        insertSubview(firstImage, at: 0)
        firstImage.contentMode = .scaleAspectFill
        
        let centerView = UIView()
        centerView.isUserInteractionEnabled = false
        centerView.backgroundColor = UIColor.MC.background_4
        insertSubview(centerView, at: 0)
        
        centerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        firstImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func onClickAnimate() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.autoreverse]) {
            self.transform = self.transform.scaledBy(x: 0.95, y: 0.95)
        } completion: { _ in
            self.transform = .identity
        }
    }
}
