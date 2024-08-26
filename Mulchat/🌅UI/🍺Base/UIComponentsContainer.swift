//
//  UIComponentsContainer.swift
//  Mulchat
//
//  Created by Nebo on 26.08.2024.
//

import Foundation
import Swinject

protocol UIComponentContainerProtocol {
    var container: Container { get }
}

class UIComponentsContainer: UIComponentContainerProtocol {
    
    static let shared = UIComponentsContainer()
    
    private init() {}
    
    var container: Container {
        get {
            if _container == nil { _container = buildContainer() }
            return _container!
        }
        set {
            _container = newValue
        }
    }
    private var _container: Container?
    
    private func buildContainer() -> Container {
        
        let container = Container()
        
        registerViewModels(container: container)
        registerViews(container: container)
        
        return container
    }
    
    private func registerViewModels(container: Container) {
        container.register(LoginViewModel.self, factory: { _ in LoginViewModel() })
    }
    
    private func registerViews(container: Container) {
        container.register(LoginView.self, factory: { _ in LoginView() })
    }
    
}
