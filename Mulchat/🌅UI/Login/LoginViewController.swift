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
        
        rootView.segmentControlView.addTarget(self, action: #selector(controlTap), for: .valueChanged)
        
        rootView.loginTextField.validator = viewModel
        rootView.loginTextField.delegte = self
    }
    
    override func setBindings() {
        super.setBindings()
    }
    
    @objc private func controlTap() {
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1) {
            self.rootView.backgroundGradientView.gradientDirection = .custom(start: .init(x: 0.5, y: 0.2), end: .init(x: 0.5, y: 1))
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        UIView.animate(withDuration: 1) {
            self.rootView.backgroundGradientView.gradientDirection = .topToBottom
        }
        return true
    }
}
