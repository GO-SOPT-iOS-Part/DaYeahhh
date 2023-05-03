//
//  MyPageViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

class MyPageViewController: BaseViewController {
    
    // MARK: - Property

    private let mainView = MyPageView()
    private let bottomMenuBar = BottomMenu()
    
    var user: TvingUser?
    
    private let dummy = MyPageMenu.dummy()

    // MARK: - Target
    
    func target() {
        mainView.headerView.profileName.text = user?.getNickNameOrId()
        mainView.topBackBtn.addTarget(self, action: #selector(tappedBackBtn), for: .touchUpInside)
        
        mainView.myPageTableView.delegate = self
        mainView.myPageTableView.dataSource = self
    }

    // MARK: - Lift Cycle
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }
    
    override func sethirarchy() {
        super.sethirarchy()
        
        view.addSubviews(bottomMenuBar)
    }
    
    override func setLayout() {
        super.setLayout()

        bottomMenuBar.snp.makeConstraints{
                $0.height.equalTo(52)
                $0.bottom.equalTo(view.safeAreaLayoutGuide)
                $0.leading.trailing.equalToSuperview()
        }
    }

}

extension MyPageViewController {
    
    // MARK: - objc func
    
    @objc func tappedBackBtn() {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - Custom func

    func userDataBind(orignalUser: TvingUser?) {
        user = orignalUser
    }
}

extension MyPageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelNextBtnTableViewCell.identifier, for: indexPath) as? LabelNextBtnTableViewCell else { return UITableViewCell() }
        cell.configCell(dummy[indexPath.section][indexPath.row])
        return cell
    }
    
}

extension MyPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection: Int) -> UIView? {
        let sectionHeader = UIView()
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection: Int) -> UIView? {
        let sectionFooter = UIView()
        
        let sectionSeparator = UIView()
        if viewForFooterInSection != dummy.count - 1 {
            sectionFooter.addSubview(sectionSeparator)
            sectionSeparator.backgroundColor = .tvingGray4
            sectionSeparator.snp.makeConstraints {
                $0.height.equalTo(0.5)
                $0.bottom.equalToSuperview()
                $0.leading.trailing.equalToSuperview()
            }
        }
        return sectionFooter
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}
