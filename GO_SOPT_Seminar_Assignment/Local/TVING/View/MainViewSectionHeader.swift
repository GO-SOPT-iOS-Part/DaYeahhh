//
//  MainHeaderView.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/05/01.
//

import UIKit

class MainViewSectionHeader: UICollectionReusableView {
        
    static let identifier = "MainViewSectionHeader"
    let mainLabel = UILabel()
    private let seeAllButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        mainLabel.do {
            $0.font = .tvingSemiBold(ofSize: 15)
            $0.textColor = .tvingGray1
        }
        seeAllButton.do {
            $0.setTitle("전체보기 >", for: .normal)
            $0.titleLabel?.font = .tvingRegular(ofSize: 12)
            $0.titleLabel?.textColor = .tvingGray2
        }
    }
    
    func setHierarchy() {
        self.addSubviews(mainLabel, seeAllButton)
    }
    func setLayout() {
        mainLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(5)
        }
        seeAllButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}
