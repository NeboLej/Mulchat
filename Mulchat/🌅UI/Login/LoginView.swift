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
    
    var autorizeformView: FormView = {
        let view = FormView()
        return view
    }()
    
    lazy var autorizeLoginTextField = MCTextField(title: "Логин", placeholder: "mulchat@pro.com")
    lazy var autoruzePasswordTextField = MCTextField(title: "Пароль", placeholder: "")
    
    var registerformView: FormView = {
        let view = FormView()
        return view
    }()
    
    lazy var registerLoginTextField = MCTextField(title: "Логин", placeholder: "mulchat@pro.com")
    lazy var registerPasswordTextField = MCTextField(title: "Пароль", placeholder: "")
    
    lazy var triangleAnimationView: TriangleAnimationView = {
        let view = TriangleAnimationView()
        view.transform = view.transform.rotated(by: CGFloat.pi * -0.07)
        return view
    }()
    
    lazy var doneButton: MCButton = {
//        let hh = UIButton(type: <#T##UIButton.ButtonType#>)
        let button = MCButton()
        let string = NSAttributedString(string: "ВХОД", attributes: [NSAttributedString.Key.foregroundColor: UIColor.MC.textDark, NSAttributedString.Key.font: UIFont.get(type: .ubuntuLight, size: 14)])
        button.setAttributedTitle(string, for: .normal)
        button.addOuterShadows()
        return button
    }()
    
    func changedSegmentAnimate(index: Int) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut]) {
            self.registerformView.snp.updateConstraints { make in
                make.centerX.equalToSuperview().offset(index == 1 ? 0 : 500)
            }
            
            self.autorizeformView.snp.updateConstraints { make in
                make.centerX.equalToSuperview().offset(index == 1 ? -500 : 0)
            }
            self.layoutIfNeeded()
        }
    }
    
    override func setupConstraints() {
        super.setupConstraints()

        addSubviews([backgroundGradientView, backgroundAnimateView, firstHalfTitleLab, secondHalfTitleLab, triangleAnimationView, segmentControlView, autorizeformView, registerformView, doneButton])
        autorizeformView.addSubviews([autorizeLoginTextField, autoruzePasswordTextField])
        registerformView.addSubviews([registerLoginTextField, registerPasswordTextField])
        
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
        
        triangleAnimationView.snp.makeConstraints { make in
            make.top.equalTo(segmentControlView.snp.bottom).offset(40)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        autorizeformView.snp.makeConstraints { make in
            make.top.equalTo(segmentControlView.snp.bottom).offset(40)
            make.width.equalTo(segmentControlView)
            make.centerX.equalToSuperview().offset(0)
        }
        
        autorizeLoginTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.right.equalToSuperview().inset(20)
        }
        
        autoruzePasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(autorizeLoginTextField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(40)
        }
        
        registerformView.snp.makeConstraints { make in
            make.top.equalTo(segmentControlView.snp.bottom).offset(40)
            make.height.width.equalTo(autorizeformView)
            make.centerX.equalToSuperview().offset(500)
        }
        
        registerLoginTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.right.equalToSuperview().inset(20)
        }
        
        registerPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(registerLoginTextField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(40)
        }
        
        doneButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(28)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(40)
            make.height.equalTo(45)
        }
    }
}
