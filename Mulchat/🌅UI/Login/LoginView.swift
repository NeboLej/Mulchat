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
//        view.gradientDirection = .custom(start: .init(x: 1, y: 0), end: .init(x: 1, y: 1))
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
    
    lazy var loginTextField = MCTextField(title: "Логин", placeholder: "mulchat@pro.com")
    lazy var passwordTextField = MCTextField(title: "Пароль", placeholder: "")
    
    override func setupConstraints() {
        super.setupConstraints()
        
        addSubviews([backgroundGradientView, backgroundAnimateView, firstHalfTitleLab, secondHalfTitleLab, loginTextField, passwordTextField])
        
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
        
        
        loginTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(20)
        }
        
    }
}
