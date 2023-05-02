//
//  MyPageViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

class MyPageViewController: TVINGBaseViewController {
    
    // MARK: - Property

    private let mainView = MyPageView()
    
    var user: TvingUser?

    // MARK: - Target
    
    func target() {
        mainView.headerView.profileName.text = user?.getNickNameOrId()
        mainView.topBackBtn.addTarget(self, action: #selector(tappedBackBtn), for: .touchUpInside)
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
