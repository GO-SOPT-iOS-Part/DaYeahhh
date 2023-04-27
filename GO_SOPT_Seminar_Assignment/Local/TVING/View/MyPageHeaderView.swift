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
        
    // MARK: - Propterty
    
    private let profileView = UIView()
    private let mySubscribeCashView = UIStackView()
    private let subscriptionView = UIButton()
    
    var profileImg = UIImageView()
    var profileName = UILabel()
    var profileChangeBtn = TvingButton()
    
    private let mySubscribe = UIView()
    private let mySubscribeImg = UIImageView()
    private let mySubscribeLabel = UILabel()
    private let mySubscribeSubLabel = UILabel()
    
    private let myCash = UIView()
    private let myCashImg = UIImageView()
    private let myCashLabel = UILabel()
    private let myCashCount = UILabel()
    
    private let subscriptionLabel = UILabel()
    private let subscriptionAttachImg = NSTextAttachment()
    private let subscriptionNextImg = UIImageView()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - style, hierarchy, layout
    
    func setStyle() {
        self.axis = .vertical
        self.spacing = 10
        self.distribution = .fill
        
        profileImg.do {
            $0.image = .profileImg
            $0.layer.cornerRadius = 15
        }
        profileName.do {
            $0.text = "다예"
            $0.textColor = .white
            $0.font = .tvingSemiBold(ofSize: 20)
        }
        profileChangeBtn.do {
            $0.setTitle("프로필 전환", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .tvingMedium(ofSize: 10)
        }
        
        mySubscribeCashView.do {
            $0.backgroundColor = .tvingGray5
            $0.axis = .vertical
            $0.layoutMargins = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
            $0.isLayoutMarginsRelativeArrangement = true
            $0.distribution = .equalSpacing
            $0.layer.cornerRadius = 3
        }
        
        mySubscribeImg.do {
            $0.image = .utilizeImg.resized(withPercentage: 0.4)
        }
        mySubscribeLabel.do {
            $0.text = "나의 이용권"
            $0.font = .tvingMedium(ofSize: 13)
            $0.textColor = .tvingGray2
        }
        mySubscribeSubLabel.do {
            $0.text = "사용중인 이용권이 없습니다."
            $0.font = .tvingMedium(ofSize: 13)
            $0.textColor = .tvingGray3
        }
        
        myCashImg.do {
            $0.image = .cashImg.resized(withPercentage: 0.4)
        }
        myCashLabel.do {
            $0.text = "티빙캐시"
            $0.font = .tvingMedium(ofSize: 13)
            $0.textColor = .tvingGray2
        }
        myCashCount.do {
            $0.text = "0"
            $0.font = .tvingSemiBold(ofSize: 13)
            $0.textColor = .white
        }
        
        subscriptionView.do {
            $0.backgroundColor = .tvingGray5
            $0.layer.cornerRadius = 3
        }
        subscriptionAttachImg.do {
            $0.image = .tvnJtbcImg.resized(withPercentage: 0.025)
        }
        subscriptionLabel.do{
            let firstString = NSAttributedString(string: "이용권을 구매하고 ")
            let secondImg = NSAttributedString(attachment: subscriptionAttachImg)
            let thirdString = NSAttributedString(string: " 등 인기 TV프로그램과\n다양한 영화 콘텐츠를 자유롭게 시청하세요!")
            $0.labelWithImg(composition: firstString, secondImg, thirdString, spacing: 5)
            $0.numberOfLines = 2
            $0.textColor = .tvingGray2
            $0.font = .tvingMedium(ofSize: 12)
        }
        subscriptionNextImg.do {
            $0.image = .nextImg.resized(withPercentage: 0.65)
        }
    }
    
    func setHierarchy() {
        
        self.addArrangedSubviews(profileView,
                                 mySubscribeCashView,
                                 subscriptionView)
        
        profileView.addSubviews(profileImg,
                                profileName,
                                profileChangeBtn)
        mySubscribeCashView.addArrangedSubviews(mySubscribe,
                                              myCash)
        subscriptionView.addSubviews(subscriptionLabel,
                                     subscriptionNextImg)
        
        mySubscribe.addSubviews(mySubscribeImg,
                                mySubscribeLabel,
                                mySubscribeSubLabel)
        myCash.addSubviews(myCashImg,
                           myCashLabel,
                           myCashCount)
    }
    
    func setLayout() {

        profileView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        mySubscribeCashView.snp.makeConstraints {
            $0.height.equalTo(90)
        }
        subscriptionView.snp.makeConstraints {
            $0.height.equalTo(70)
        }
        
        profileImg.snp.makeConstraints {
            $0.size.equalTo(72)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        profileName.snp.makeConstraints {
            $0.height.equalTo(60)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(profileImg.snp.trailing).offset(15)
        }
        profileChangeBtn.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(25)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        mySubscribe.snp.makeConstraints {
            $0.height.equalTo(30)
        }
        myCash.snp.makeConstraints {
            $0.height.equalTo(30)
        }
        
        mySubscribeImg.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
        }
        mySubscribeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(mySubscribeImg.snp.trailing).offset(10)
        }
        mySubscribeSubLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
        }
        
        myCashImg.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
        }
        myCashLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(myCashImg.snp.trailing).offset(10)
        }
        myCashCount.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
        }
        
        subscriptionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
        }
        subscriptionNextImg.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
        }
    }
}
