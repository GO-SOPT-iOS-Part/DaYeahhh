//
//  MyPageView.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

class MyPageView: UIView {
    
    // MARK: - Property
    
    private let topButtonSheet = UIView()
    private let myPageTableView = UITableView()
    
    let topBackBtn = UIButton()
    let topNotificationBtn = UIButton()
    let topSettingBtn = UIButton()
    
    private let sectionNum: Int = 2
    private let settingMyDummy: [String] = ["이용권",
                                            "1:1 문의내역",
                                            "예약알림",
                                            "회원정보 수정",
                                            "프로모션 정보 수신 동의"]
    private let aboutTvingDummy: [String] = ["공지사항",
                                             "이벤트",
                                             "고객센터",
                                             "티빙 알아보기"]
    
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

private extension MyPageView {
    
    // MARK: - style
    
    func style() {
        
        myPageTableView.do {
            $0.register(LabelNextBtnTableViewCell.self, forCellReuseIdentifier: LabelNextBtnTableViewCell.identifier)
            $0.rowHeight = 48
            $0.dataSource = self
            $0.backgroundColor = .black
        }
        topBackBtn.do {
            $0.setImage(.backImg.resized(withPercentage: 1.4), for: .normal)
        }
        topNotificationBtn.do {
            $0.setImage(.bellImg.resized(withPercentage: 1.4), for: .normal)
        }
        topSettingBtn.do {
            $0.setImage(.settingImg.resized(withPercentage: 1.4), for: .normal)
        }
    }
    
    // MARK: - layout
    
    func hierarchy() {
        
        self.addSubviews(topButtonSheet,
                         myPageTableView)
        
        topButtonSheet.addSubviews(topBackBtn,
                                   topNotificationBtn,
                                   topSettingBtn)
    }
    
    func setLayout() {
        
        topButtonSheet.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        myPageTableView.snp.makeConstraints {
            $0.top.equalTo(topButtonSheet.snp.bottom)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(52)
            $0.leading.trailing.equalToSuperview()
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

extension MyPageView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNum
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0: return settingMyDummy.count
        case 1: return aboutTvingDummy.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelNextBtnTableViewCell.identifier, for: indexPath) as? LabelNextBtnTableViewCell else { return UITableViewCell() }
        
        switch indexPath.section{
        case 0: cell.configCell(settingMyDummy[indexPath.row])
        case 1: cell.configCell(aboutTvingDummy[indexPath.row])
        default:
            print("sectionNum Error")
        }
        return cell
    }
    
}
