//
//  LifecycleService.swift
//  Mulchat
//
//  Created by Nebo on 27.08.2024.
//

import NotificationCenter
import Foundation
import RxCocoa
import RxSwift
import RxRelay

protocol LifecycleServiceProtocol {
    var appLifeState: BehaviorRelay<AppLifecycle> { get }
}

enum AppLifecycle: Int {
    case background, foreground
}


class LifecycleService: LifecycleServiceProtocol {
    
    private var dispBag = DisposeBag()
    
    var appLifeState = BehaviorRelay<AppLifecycle>(value: .foreground)

    init() {
        
        UIApplication.rx.didBecomeActive
            .subscribe(onNext: { self.appLifeState.accept(.foreground) })
            .disposed(by: dispBag)

        UIApplication.rx.willResignActive
            .subscribe(onNext: { self.appLifeState.accept(.background) })
            .disposed(by: dispBag)
    }
}
