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
        
        rootView.autorizeLoginTextField.validator = viewModel
        rootView.autorizeLoginTextField.delegte = self
    }
    
    override func setBindings() {
        super.setBindings()
    }
    
    @objc private func controlTap(_ sender: UISegmentedControl) {
        rootView.changedSegmentAnimate(index: sender.selectedSegmentIndex)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        rootView.autorizeformView.onFocus()
        UIView.animate(withDuration: 1) {
            self.rootView.backgroundGradientView.gradientDirection = .custom(start: .init(x: 0.5, y: 0.2), end: .init(x: 0.5, y: 1))
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        rootView.autorizeformView.onFocus()
        UIView.animate(withDuration: 1) {
            self.rootView.backgroundGradientView.gradientDirection = .topToBottom
        }
        return true
    }
}
