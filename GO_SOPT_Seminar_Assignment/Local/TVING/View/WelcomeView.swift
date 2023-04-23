//
//  WelcomeView.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/16.
//

import UIKit

class WelcomeView: UIView {

    private let mainImgView = UIImageView().then {
        $0.image = UIImage(named: "tiving_logo")
    }
    
    let welcomeLabel = UILabel().then {
        $0.text = "님\n반가워요!"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 3
        $0.font = .tvingSemiBold(ofSize: 23)
    }
    
    lazy var goToMainBtn = UIButton().then {
        $0.setTitle("메인으로", for: .normal)
        $0.titleLabel?.font = .tvingMedium(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.backgroundColor = .tvingRed
        $0.layer.cornerRadius = 3
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

private extension WelcomeView {
    func style() {
        self.backgroundColor = .black
    }
    
    func hierarchy() {
        self.addSubviews(mainImgView,
                         welcomeLabel,
                         goToMainBtn)
    }
    
    func setLayout() {
        mainImgView.snp.makeConstraints {
            $0.height.equalTo(mainImgView.snp.width).multipliedBy(0.56)
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(14)
            $0.leading.trailing.equalToSuperview()
        }
        welcomeLabel.snp.makeConstraints {
            $0.height.equalTo(75)
            $0.top.equalTo(mainImgView.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        goToMainBtn.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(66)
        }
    }
}
