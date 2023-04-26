//
//  MyPageHeaderView.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/27.
//

import UIKit

import SnapKit
import Then

class MyPageHeaderView: UIStackView {
    
    static let headerIdentifier = "MyPageHeaderView"
    
    private let profileView = UIView()
    private let subscribeCashView = UIStackView()
    private let subscriptionView = UIView()
    
    let profileImg = UIImageView()
    let profileName = UILabel()
    let profileChangeBtn = TvingButton()
    
    private let mySubscribe = UIView()
    private let myCash = UIView()
    
    private let subscribeImg = UIImageView()
    private let subscribeLabel = UILabel()
    private let subscribeSubLabel = UILabel()
    private let cashImg = UIImageView()
    private let cashLabel = UILabel()
    private let cashCount = UILabel()
    
    private let subscriptionLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        self.axis = .vertical
        self.spacing = 10
        self.distribution = .fill
        
        subscribeCashView.do {
            $0.backgroundColor = .tvingGray5
            $0.axis = .vertical
            $0.distribution = .fillEqually
        }
        
        subscribeImg.do {
            $0.image = .utilizeImg.resized(withPercentage: 0.5)
        }
        subscribeLabel.do {
            $0.text = "나의 이용권"
            $0.font = .tvingMedium(ofSize: 14)
            $0.textColor = .tvingGray3
        }
        subscribeSubLabel.do {
            $0.text = "사용중인 이용권이 없습니다."
            $0.font = .tvingMedium(ofSize: 14)
            $0.textColor = .tvingGray3
        }
        cashImg.do {
            $0.image = .cashImg.resized(withPercentage: 0.5)
        }
        cashLabel.do {
            $0.text = "티빙캐시"
            $0.font = .tvingMedium(ofSize: 14)
            $0.textColor = .tvingGray3
        }
        cashCount.do {
            $0.text = "0"
            $0.font = .tvingSemiBold(ofSize: 14)
            $0.textColor = .white
        }
        
        
        subscriptionView.do {
            $0.backgroundColor = .tvingGray5
        }
    
        profileImg.do {
            $0.image = .profileImg
            $0.layer.cornerRadius = 15
        }
        profileName.do {
            $0.text = "다예"
            $0.textColor = .white
            $0.font = .tvingMedium(ofSize: 18)
        }
        profileChangeBtn.do {
            $0.setTitle("프로필 전환", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .tvingMedium(ofSize: 10)
        }
    }
    
    func setHierarchy() {
        
        self.addArrangedSubviews(profileView,
                                 subscribeCashView,
                                 subscriptionView)
        
        profileView.addSubviews(profileImg,
                                profileName,
                                profileChangeBtn)
        
        subscribeCashView.addArrangedSubviews(mySubscribe,
                                              myCash)
        mySubscribe.addSubviews(subscribeImg,
                                subscribeLabel,
                                subscribeSubLabel)
        myCash.addSubviews(cashImg,
                           cashLabel,
                           cashCount)
        
    }
    
    func setLayout() {
        
        profileView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.trailing.equalToSuperview()
        }
        subscribeCashView.snp.makeConstraints {
            $0.height.equalTo(90)
            $0.leading.trailing.equalToSuperview()
        }
        subscriptionView.snp.makeConstraints {
            $0.height.equalTo(70)
            $0.leading.trailing.equalToSuperview()
        }
        
        mySubscribe.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        myCash.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        subscribeImg.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        subscribeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(subscribeImg.snp.trailing).offset(10)
        }
        subscribeSubLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
        cashImg.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        cashLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(subscribeImg.snp.trailing).offset(10)
        }
        cashCount.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
        
        profileImg.snp.makeConstraints {
            $0.size.equalTo(72)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        profileName.snp.makeConstraints {
            $0.height.equalTo(60)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(profileImg.snp.trailing).offset(20)
        }
        profileChangeBtn.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(25)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
        }
    }
    
}
