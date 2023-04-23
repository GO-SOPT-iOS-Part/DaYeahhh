//
//  CustomPasswordTextField.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/17.
//

import UIKit

import SnapKit
import Then

// Password TextField - clear, security button

class CustomPasswordTextField: UITextField {
    
    private var securityTrue: Bool = true
    
    public lazy var clearButton = UIButton().then {
        $0.setImage(UIImage(named: "x-circle.png"), for: .normal)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(self.clearCustomPasswordTextField), for: .touchUpInside)
    }
    
    public lazy var securityBtn = UIButton().then {
        $0.setImage(UIImage(named: "eye-slash.png"), for: .normal)
        $0.addTarget(self, action: #selector(self.securityTextField), for: .touchUpInside)
    }
    
    private func target() {
        self.addTarget(self, action: #selector(self.textFieldDidChange), for: .allEditingEvents)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        setLayout()
        target()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        self.setLeftRightPadding(rightPadding: 98.0)
        self.layer.cornerRadius = 3
        self.isSecureTextEntry = securityTrue
        self.autocapitalizationType = .none
        self.keyboardType = .asciiCapable
    }
    
    func setLayout() {
        self.addSubviews(clearButton, securityBtn)

        securityBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
        
        clearButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(securityBtn.snp.leading).offset(-16)
        }
    }
    
    @objc
    func clearCustomPasswordTextField() {
        self.text = ""
    }
    
    @objc
    func securityTextField() {
        securityTrue = !securityTrue
        self.isSecureTextEntry = securityTrue
        let securityBtnImg = securityTrue ? UIImage(named: "eye-slash.png") : UIImage(named: "eye-non-slash.png")
        securityBtn.setImage(securityBtnImg, for: .normal)
    }
    
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        self.clearButton.isHidden = !self.hasText || !self.isEditing
    }
}
