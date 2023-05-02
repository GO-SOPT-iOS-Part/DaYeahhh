//
//  MyPageView.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

class MyPageView: BaseView {
    
    // MARK: - Property
    
    private let topButtonMenu = UIView()
    let myPageTableView = UITableView()
    
    let headerView = MyPageViewHeader()
    let logOutBtn = CustomTvingButton()
    
    let topBackBtn = UIButton()
    let topNotificationBtn = UIButton()
    let topSettingBtn = UIButton()
        
    // MARK: - style
    
    override func setStyle() {
        super.setStyle()
        
        myPageTableView.do {
            $0.register(LabelNextBtnTableViewCell.self,
                        forCellReuseIdentifier: LabelNextBtnTableViewCell.identifier)
            $0.rowHeight = 52
            $0.sectionHeaderTopPadding = 0
            $0.separatorStyle = .none
            $0.backgroundColor = .black
            $0.tableHeaderView = headerView
            $0.tableFooterView = logOutBtn
            $0.tableHeaderView?.frame.size.height = 280
        }
        logOutBtn.do {
            $0.setTitle("로그아웃", for: .normal)
            $0.setTitleColor(.tvingGray1, for: .normal)
            $0.titleLabel?.font = .tvingMedium(ofSize: 15)
            $0.frame.size.height = 52
        }
        
        topBackBtn.do {
            $0.setImage(.backImg, for: .normal)
        }
        topNotificationBtn.do {
            $0.setImage(.notificationImg.resized(withPercentage: 0.05), for: .normal)
        }
        topSettingBtn.do {
            $0.setImage(.settingImg.resized(withPercentage: 0.045), for: .normal)
        }
    }
    
    // MARK: - layout
    
    override func setHierarchy() {
        
        self.addSubviews(topButtonMenu,
                         myPageTableView)
        
        topButtonMenu.addSubviews(topBackBtn,
                                   topNotificationBtn,
                                   topSettingBtn)
    }
    
    override func setLayout() {
        
        topButtonMenu.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        myPageTableView.snp.makeConstraints {
            $0.top.equalTo(topButtonMenu.snp.bottom)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(52)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        topBackBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        topNotificationBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(topSettingBtn.snp.leading).offset(-15)
        }
        
        topSettingBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
