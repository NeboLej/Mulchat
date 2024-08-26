//
//  BaseViewController.swift
//  Mulchat
//
//  Created by Nebo on 26.08.2024.
//

import UIKit

class BaseViewController<VM: BaseViewModel, View: BaseView>: UIViewController {
    
    lazy private(set) var viewModel: VM! = UIComponentsContainer.shared.container.resolve(VM.self)
    lazy private(set) var rootView: View = UIComponentsContainer.shared.container.resolve(View.self)!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        setBindings()
        setupUI()
        viewModel.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardAdjust(rect: keyboardSize, showing: true)
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardAdjust(rect: keyboardSize, showing: false)
        }
    }
    //for override
    func setupUI() {}
    func setBindings() {}
    func keyboardAdjust(rect: CGRect, showing: Bool) {}
    
}
