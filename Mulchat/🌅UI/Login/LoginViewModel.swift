//
//  LoginViewModel.swift
//  Mulchat
//
//  Created by Nebo on 26.08.2024.
//

import Foundation
import RxSwift
import RxRelay

final class LoginViewModel: BaseViewModel {
    
    private let lifecycleService: LifecycleServiceProtocol
    private let disposeBag = DisposeBag()
    
    var reloadAnimate = BehaviorRelay(value: true)
    
    override init() {
        lifecycleService = LifecycleService()
        super.init()
        
        lifecycleService.appLifeState
            .map { $0 == .foreground }
            .bind(to: reloadAnimate)
            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#function)
    }
}
