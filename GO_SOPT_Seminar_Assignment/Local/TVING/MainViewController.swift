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
    var user: TvingUserInfo?
    
    // MARK: - Target

    private func target() {
        mainView.goToMyPageBtn.addTarget(self, action: #selector(tappedGoToMyPageBtn), for: .touchUpInside)
    }

    // MARK: - Lift Cycle

    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        target()
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

    func userDataBind(orignalUser: TvingUserInfo) {
        user = orignalUser
    }

}
