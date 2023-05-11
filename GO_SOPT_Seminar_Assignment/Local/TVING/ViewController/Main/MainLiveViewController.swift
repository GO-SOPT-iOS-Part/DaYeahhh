//
//  MainLiveViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/05/03.
//

import UIKit

class MainLiveViewController: MainBaseViewController {

    private let mainView = UIImageView()
    
    override func setStyle() {
        super.setStyle()
        
        mainView.do {
            $0.image = .liveView
        }
    }
    
    override func sethirarchy() {
        super.sethirarchy()
        
        view.addSubview(mainView)
    }
    
    override func setLayout() {
        super.setLayout()
        
        mainView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}
