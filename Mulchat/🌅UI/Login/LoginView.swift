//
//  LoginView.swift
//  Mulchat
//
//  Created by Nebo on 26.08.2024.
//

import UIKit
import SnapKit

final class LoginView: BaseView {
    
    lazy var backgroundAnimateView = BackgroundAnimateView()
    
    lazy var backgroundGradientView: GradientView  = {
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
    
    lazy var segmentControlView: MCSegmentControl = {
        let control = MCSegmentControl(items: ["0", "1"])
        control.setTitle("Авторизация", forSegmentAt: 0)
        control.setTitle("Регистрация", forSegmentAt: 1)
        control.selectedSegmentIndex = 0
        control.selectedSegmentTintColor = UIColor.MC.accent_1
        control.backgroundColor = UIColor.black
        control.setTitleTextAttributes([.foregroundColor: UIColor.MC.textLight, .font: UIFont.get(type: .ubuntuLight, size: 14)], for: .normal)
 
        return control
    }()
    
    private var autorizeformView: FormView = {
        let view = FormView()
        return view
    }()
    
    lazy var loginTextField = MCTextField(title: "Логин", placeholder: "mulchat@pro.com")
    lazy var passwordTextField = MCTextField(title: "Пароль", placeholder: "")
    
    override func setupConstraints() {
        super.setupConstraints()

        addSubviews([backgroundGradientView, backgroundAnimateView, firstHalfTitleLab, secondHalfTitleLab, segmentControlView, autorizeformView])
        autorizeformView.addSubviews([loginTextField, passwordTextField])
        
        backgroundGradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundAnimateView.snp.makeConstraints { make in
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
        
        segmentControlView.snp.makeConstraints { make in
            make.top.equalTo(secondHalfTitleLab.snp.bottom).offset(36)
            make.left.right.equalToSuperview().inset(28)
            make.height.equalTo(30)
        }
        
        autorizeformView.snp.makeConstraints { make in
            make.top.equalTo(segmentControlView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(28)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.right.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(40)
        }
    }
}

extension UIView {
    func applyBlurEffect(_ style: UIBlurEffect.Style = .dark) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}
