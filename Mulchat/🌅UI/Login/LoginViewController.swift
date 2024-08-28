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
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.stars.start()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        rootView.stars.start()
    }
    
    override func setBindings() {
        super.setBindings()
        
        viewModel.reloadAnimate.bind { _ in
            self.rootView.stars.start()
        }.disposed(by: disposeBag)
    }
}
