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
    
    var user: TvingUserInfo?

    // MARK: - Target

    // MARK: - Lift Cycle
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MyPageViewController {
    
    // MARK: - objc func

    // MARK: - Custom func

    func userDataBind(orignalUser: TvingUserInfo?) {
        user = orignalUser
    }
}
