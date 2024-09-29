//
//  MCTextField.swift
//  Mulchat
//
//  Created by Nebo on 05.09.2024.
//

import UIKit
import SnapKit

enum ResultValidate {
    case success
    case error(String)
}

protocol TextFieldValidatorProtocol: AnyObject {
    func textFieldIsValid(tag: Int, text: String) -> ResultValidate
}

final class MCTextField: UIView {
    
    weak var validator: TextFieldValidatorProtocol?
    weak var delegate: UITextFieldDelegate? {
        didSet {
            textField.delegate = delegate
        }
    }
    
    private lazy var titleLab: UILabel = {
        let label = UILabel(color: UIColor.MC.textDescription, font: .get(type: .ubuntuLight, size: 12))
        return label
    }()
    
    private lazy var textField: UITextField = {
        let tf = InsetsTextField(textInsets: .init(top: 0, left: 7, bottom: 0, right: 7))
        tf.font = .get(type: .ubuntuLight, size: 14)
        tf.textColor = UIColor.MC.textDark
        tf.tintColor = .accent1
        tf.backgroundColor = UIColor.MC.background_3
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 2
        return tf
    }()
    
    private lazy var errorLab: UILabel = {
        let label = UILabel(color: UIColor.MC.textError, font: .get(type: .ubuntuLight, size: 9))
        return label
    }()
    
    func set(title: String? = nil, text: String? = nil, error: String? = nil) {
        if let title { titleLab.text = title }
        if let text { textField.text = text }
        if let error { errorLab.text = error }
    }
    
    init(title: String, placeholder: String) {
        super.init(frame: .zero)
        titleLab.text = title
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.MC.textDescription])
        textField.addTarget(self, action: #selector(changedText), for: .editingChanged)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textField.addInnerShadow(to: [.top], radius: 5, opacity: 0.5, color: .black)
    }
    
    @objc private func changedText() {
        guard let resultValidate = validator?.textFieldIsValid(tag: tag, text: textField.text ?? "") else { return }
        switch resultValidate {
        case .success:
            errorLab.text = ""
            textField.layer.borderColor = UIColor.clear.cgColor
        case .error(let error):
            errorLab.text = error
            textField.layer.borderColor = UIColor.MC.backgroundError.cgColor
        }
    }
    
    private func setupUI() {
        addSubviews([titleLab, textField, errorLab])
        
        titleLab.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview().inset(6)
        }
        
        textField.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLab.snp.bottom).offset(6)
            make.height.equalTo(34)
        }
        
        errorLab.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(6)
            make.left.right.equalTo(textField).inset(6)
            make.height.equalTo(10)
            make.bottom.equalToSuperview()
        }
    }
}
