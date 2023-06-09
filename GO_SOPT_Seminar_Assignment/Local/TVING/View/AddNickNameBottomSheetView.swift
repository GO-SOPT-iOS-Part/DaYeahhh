//
//  AddNickNameBottomSheetView.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/15.
//

import UIKit

import SnapKit
import Then

final class AddNickNameBottomSheetView: UIView {
    
    let bottomSheetHeight = UIScreen.main.bounds.height / 2
    
    let dimmendView = UIView().then {
        $0.backgroundColor = .black.withAlphaComponent(0.5)
    }
    
    private lazy var dragIndicatior = UIView().then {
        $0.backgroundColor = .tvingGray1
        $0.layer.cornerRadius = 3
    }
    
    let bottomSheetView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]   // 좌우측 하단은 그대로
    }
    
    private let nickNameMainLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.font = .tvingMedium(ofSize: 23)
    }
    
    let nickNameTextField = CustomTextField().then {
        $0.placeholder = "닉네임"
        $0.setPlaceholderColor(.tvingGray1)
        $0.textColor = .black
        $0.backgroundColor = .tvingGray2
        $0.font = .tvingMedium(ofSize: 14)
    }
    
    lazy var saveNickNameBtn = UIButton().then {
        $0.setTitle("저장하기", for: .normal)
        $0.titleLabel?.font = .tvingMedium(ofSize: 16)
        $0.titleLabel?.textAlignment = .center
        $0.titleLabel?.textColor = .tvingGray2
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 12
        $0.isEnabled = false
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

private extension AddNickNameBottomSheetView {
    
    func style() {

    }
    
    func hierarchy() {
        self.addSubviews(dimmendView,
                         dragIndicatior,
                         bottomSheetView)
        bottomSheetView.addSubviews(nickNameMainLabel,
                                    nickNameTextField,
                                    saveNickNameBtn)
    }
    
    func setLayout() {
        
        dimmendView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bottomSheetView.snp.makeConstraints {
            $0.height.equalTo(bottomSheetHeight)
            $0.bottom.left.right.equalToSuperview()
            $0.top.equalToSuperview().inset(UIScreen.main.bounds.height - bottomSheetHeight)
        }
        
        dragIndicatior.snp.makeConstraints {
            $0.height.equalTo(5)
            $0.leading.trailing.equalToSuperview().inset(120)
            $0.bottom.equalTo(bottomSheetView.snp.top).inset(-10)
        }

        nickNameMainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(45)
            $0.leading.equalToSuperview().inset(20)
        }

        nickNameTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(nickNameMainLabel.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
        }

        saveNickNameBtn.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
}
