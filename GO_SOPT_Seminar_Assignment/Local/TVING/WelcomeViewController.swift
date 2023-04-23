//
//  WelcomeViewController.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/12.
//

import UIKit

final class WelcomeViewController: BaseViewController {
    
    // MARK: - Property

    private let mainView = WelcomeView()
    
    // MARK: - Target

    private func target() {
        mainView.goToMainBtn.addTarget(self, action: #selector(tappedGoToMainBtn), for: .touchUpInside)
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

extension WelcomeViewController {
    
    func idDataBind(idOrNick: String) {
        mainView.welcomeLabel.text = "\(idOrNick)님\n반가워요!"
    }
    
    @objc
    func tappedGoToMainBtn() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
