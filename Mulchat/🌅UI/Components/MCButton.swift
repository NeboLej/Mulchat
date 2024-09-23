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
    
    private func onClickAnimate() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.autoreverse]) {
            self.transform = self.transform.scaledBy(x: 0.95, y: 0.95)
        } completion: { _ in
            self.transform = .identity
        }
    }
}
