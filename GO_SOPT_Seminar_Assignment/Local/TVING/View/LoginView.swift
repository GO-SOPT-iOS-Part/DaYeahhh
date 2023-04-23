//
//  LoginView.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/16.
//

import UIKit

class LoginView: UIView {

    // MARK: - Object Setting
    
    private let mainLabel = UILabel().then {
        $0.text = "TVING ID 로그인"
        $0.font = .tvingMedium(ofSize: 23)
        $0.textColor = .tvingGray1
        $0.textAlignment = .center
    }
    
    let idTextField = CustomTextField().then {
        $0.placeholder = "이메일"
        $0.setPlaceholderColor(.tvingGray2)
        $0.font = .tvingMedium(ofSize: 15)
        $0.textColor = .tvingGray2
        $0.backgroundColor = .tvingGray4
        $0.keyboardType = .emailAddress
    }
    
    let idInvalidLabel = UILabel().then {
        $0.textColor = .systemRed
        $0.font = .systemFont(ofSize: 12)
        $0.text = "* 올바르지 않은 이메일 형식입니다 😭"
        $0.isHidden = true
    }
    
    let passwordTextField = CustomPasswordTextField().then {
        $0.placeholder = "비밀번호"
        $0.setPlaceholderColor(.tvingGray2)
        $0.font = .tvingMedium(ofSize: 15)
        $0.textColor = .tvingGray2
        $0.backgroundColor = .tvingGray4
        $0.keyboardType = .asciiCapable
    }
    
    lazy var logInBtn = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(.tvingGray2, for: .normal)
        $0.titleLabel?.font = .tvingMedium(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.layer.borderColor = UIColor.tvingGray4.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
        $0.isEnabled = false
    }
    
    private let idPasswordStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = 40
    }
    
    lazy var findIdBtn = UIButton().then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(.tvingGray2, for: .normal)
        $0.titleLabel?.font = .tvingMedium(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
    }
    
    lazy var findPasswordBtn = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(.tvingGray2, for: .normal)
        $0.titleLabel?.font = .tvingMedium(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
    }
    
    private let makeAccountStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = 20
    }
    
    let askExistAccountLabel = UILabel().then {
        $0.text = "아직 계정이 없으신가요?"
        $0.font = .tvingRegular(ofSize: 14)
        $0.textColor = .tvingGray3
        $0.textAlignment = .center
    }
    
    lazy var goToMakeNicknameBtn = UIButton().then {
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.setTitleColor(.tvingGray2, for: .normal)
        $0.titleLabel?.font = .tvingRegular(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.setUnderline()
    }
    
    lazy var backBtn = UIButton().then {
        $0.setImage(UIImage(named: "btn_before"), for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension LoginView {
    
    func style() {
        self.backgroundColor = .black
    }
    
    func hierarchy() {
        self.addSubviews(mainLabel,
                         idTextField,
                         idInvalidLabel,
                         passwordTextField,
                         logInBtn,
                         idPasswordStackView,
                         makeAccountStackView,
                         backBtn)
        idPasswordStackView.addArrangedSubviews(findIdBtn,
                                               findPasswordBtn)
        makeAccountStackView.addArrangedSubviews(askExistAccountLabel,
                                                 goToMakeNicknameBtn)
    }
    
    
    func setLayout() {
        
        mainLabel.snp.makeConstraints{
            $0.height.equalTo(37)
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(50)
            $0.leading.trailing.equalToSuperview().inset(100)
        }
        
        idTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(mainLabel.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        logInBtn.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        idPasswordStackView.snp.makeConstraints {
            $0.height.equalTo(25)
            $0.top.equalTo(logInBtn.snp.bottom).offset(30)
            $0.centerX.equalToSuperview().inset(80)
        }
        
        makeAccountStackView.snp.makeConstraints {
            $0.height.equalTo(25)
            $0.top.equalTo(idPasswordStackView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview().inset(50)
        }
        
        backBtn.snp.makeConstraints{
            $0.height.equalTo(15)
            $0.width.equalTo(8)
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(25)
            $0.leading.equalToSuperview().inset(24)
        }
        
        findIdBtn.snp.makeConstraints{
            $0.width.equalTo(70)
            $0.height.equalTo(22)
        }
        
        findPasswordBtn.snp.makeConstraints{
            $0.width.equalTo(80)
            $0.height.equalTo(22)
        }
        
        askExistAccountLabel.snp.makeConstraints{
            $0.width.equalTo(140)
            $0.height.equalTo(22)
        }
        
        goToMakeNicknameBtn.snp.makeConstraints{
            $0.width.equalTo(128)
            $0.height.equalTo(22)
        }
    }
}
