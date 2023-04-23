//
//  CustomTextField.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/17.
//

import UIKit

import SnapKit
import Then

// TextField with clear button

class CustomTextField: UITextField {
    
    public lazy var clearButton = UIButton().then {
        $0.setImage(UIImage(named: "x-circle.png"), for: .normal)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(self.clearCustomTextField), for: .touchUpInside)
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
        self.setLeftRightPadding(rightPadding: 42.0)
        self.layer.cornerRadius = 3
        self.autocapitalizationType = .none
    }
    
    func setLayout() {
        self.addSubviews(clearButton)
        
        clearButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    @objc
    func clearCustomTextField() {
        self.text = ""
    }
    
    @objc
    func textFieldDidChange(_ textField: UITextField) {
//        self.clearButton.isHidden = self.hasText|| !self.isEditing
    }
    
}
