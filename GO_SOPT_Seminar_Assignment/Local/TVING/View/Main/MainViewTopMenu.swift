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
    
    let topSegment = UIScrollView()
    let topSegmentLabelStackView = UIStackView()
    let topSegmentIndicator = MainViewSegmentIndicator()
    
    let homeLabel = UILabel()
    let liveLavel = UILabel()
    let tvProgramLabel = UILabel()
    let movieLabel = UILabel()
    let paramountLabel = UILabel()
    let kidsLabel = UILabel()
    
    
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
        
        topSegment.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
        }
        topSegmentLabelStackView.do {
            $0.axis = .horizontal
            $0.spacing = 30
            $0.distribution = .fillProportionally
        }
        homeLabel.do {
            $0.text = "홈"
            $0.textColor = .white
            $0.font = .tvingMedium(ofSize: 17)
        }
        liveLavel.do {
            $0.text = "실시간"
            $0.textColor = .white
            $0.font = .tvingMedium(ofSize: 17)
        }
        tvProgramLabel.do {
            $0.text = "TV프로그램"
            $0.textColor = .white
            $0.font = .tvingMedium(ofSize: 17)
        }
        movieLabel.do {
            $0.text = "영화"
            $0.textColor = .white
            $0.font = .tvingMedium(ofSize: 17)
        }
        paramountLabel.do {
            $0.text = "파라마운트+"
            $0.textColor = .white
            $0.font = .tvingMedium(ofSize: 17)
        }
        kidsLabel.do {
            $0.text = "키즈"
            $0.textColor = .white
            $0.font = .tvingMedium(ofSize: 17)
        }
    }
    
    private func setHierarchy() {
        self.addSubviews(topMenu,
                         topSegment)
        
        topMenu.addSubviews(topLogoBtn,
                            topPairingBtn,
                            topprofileBtn)
        
        topSegment.addSubviews(topSegmentLabelStackView,
                               topSegmentIndicator)
        
        topSegmentLabelStackView.addArrangedSubviews(homeLabel,
                                                     liveLavel,
                                                     tvProgramLabel,
                                                     movieLabel,
                                                     paramountLabel,
                                                     kidsLabel)
    }
    private func setLayout() {
        topMenu.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalToSuperview().inset(40)
            $0.leading.trailing.equalToSuperview()
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
        
        topSegment.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalTo(topMenu.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
        topSegmentLabelStackView.snp.makeConstraints {
            $0.height.equalTo(25)
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        topSegmentIndicator.snp.makeConstraints {
            $0.height.equalTo(5)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(topSegmentLabelStackView.snp.bottom).offset(10)
        }
        
        homeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
        liveLavel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
        tvProgramLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
        movieLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
        paramountLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
        kidsLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
    }
}
