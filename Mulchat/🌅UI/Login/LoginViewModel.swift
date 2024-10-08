//
//  LoginViewModel.swift
//  Mulchat
//
//  Created by Nebo on 26.08.2024.
//

import RxSwift
import RxRelay

final class LoginViewModel: BaseViewModel {
    
}

//MARK: TextFieldValidatorProtocol
extension LoginViewModel: TextFieldValidatorProtocol {
    func textFieldIsValid(tag: Int, text: String) -> ResultValidate {
        if text.count < 4 {
            ResultValidate.error("очень мало ввел")
        } else {
            ResultValidate.success
        }
    }
}
