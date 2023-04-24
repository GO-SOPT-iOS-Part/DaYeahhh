//
//  MainView.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

class MainView: UIView {
    
    let goToMyPageBtn = UIButton()
    
    // MARK: - init

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

private extension MainView {
    
    // MARK: - style

    func style() {
        goToMyPageBtn.do {
            $0.setTitle("마이페이지", for: .normal)
            $0.titleLabel?.textAlignment = .center
            $0.titleLabel?.font = .tvingRegular(ofSize: 16)
            $0.backgroundColor = .tvingRed
            $0.layer.cornerRadius = 3
        }
    }
    
    // MARK: - layout

    func hierarchy() {
        self.addSubviews(goToMyPageBtn)
    }
    
    func setLayout() {
        goToMyPageBtn.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(48)
            $0.width.equalTo(96)
        }
    }
}
