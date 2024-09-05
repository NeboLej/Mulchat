//
//  LoginViewController.swift
//  Mulchat
//
//  Created by Nebo on 26.08.2024.
//

import UIKit
import SnapKit
import RxSwift

final class LoginViewController: BaseViewController<LoginViewModel, LoginView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.loginTextField.validator = viewModel
        rootView.loginTextField.delegte = self
    }
    
    override func setBindings() {
        super.setBindings()
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1.5) {
            self.rootView.backgroundGradientView.gradientDirection = .custom(start: .init(x: 0.3, y: 0), end: .init(x: 0.7, y: 1))
//            self.rootView.backgroundGradientView.setColors(colors: [.MC.background_2, .MC.background_2, .MC.accent_1])
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        UIView.animate(withDuration: 1.5) {
            self.rootView.backgroundGradientView.gradientDirection = .topToBottom
//            self.rootView.backgroundGradientView.setColors(colors: [.MC.background_2, .MC.accent_1, .MC.accent_1])
        }
        return true
    }
}
