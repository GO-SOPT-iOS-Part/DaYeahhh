//
//  MainViewTopView.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/05/02.
//

import UIKit

class MainViewTopMenu: UIView {

    let topMenu = UIView()
    let topLogoBtn = UIButton()
    let topPairingBtn = UIButton()
    let topprofileBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .clear
        
        topMenu.do {
            $0.backgroundColor = .clear
        }
        topLogoBtn.do {
            $0.setImage(.tvingWhiteLogo, for: .normal)
        }
        topPairingBtn.do {
            $0.setImage(.pairingImg, for: .normal)
        }
        topprofileBtn.do {
            $0.setImage(.profileImg.resized(withPercentage: 0.1), for: .normal)
            $0.makeRounded(radius: 3)
        }
    }
    private func setHierarchy() {
        self.addSubviews(topMenu)
        
        topMenu.addSubviews(topLogoBtn,
                            topPairingBtn,
                            topprofileBtn)
    }
    private func setLayout() {
        topMenu.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        topLogoBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        topPairingBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(topprofileBtn.snp.leading).offset(-20)
        }
        topprofileBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}
