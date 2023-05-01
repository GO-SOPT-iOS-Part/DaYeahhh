//
//  MainViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

class MainViewController: TVINGBaseViewController {

    // MARK: - Property

    private let mainView = MainView()
    let topMenu = MainViewTop()
    
    var user: TvingUser?
    
    // MARK: - Target

    private func target() {
        topMenu.topprofileBtn.addTarget(self, action: #selector(tappedGoToMyPageBtn), for: .touchUpInside)
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
        
        view.addSubviews(topMenu)
    }
    override func setLayout() {
        super.setLayout()
        
        topMenu.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

extension MainViewController {
    
    // MARK: - objc func

    @objc
    func tappedGoToMyPageBtn() {
        let myPageViewController = MyPageViewController()
        myPageViewController.userDataBind(orignalUser: user)
        self.navigationController?.pushViewController(myPageViewController, animated: true)
    }
    
    // MARK: - Custom func

    func userDataBind(orignalUser: TvingUser) {
        user = orignalUser
    }

}

