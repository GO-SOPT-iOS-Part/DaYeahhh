//
//  TVINGBaseViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

class TVINGBaseViewController: BaseViewController {
    
    let bottomMenu = UIStackView()
    let bottomHomeBtn = UIButton()
    let bottomPreBtn = UIButton()
    let bottomSearchBtn = UIButton()
    let bottomRecordBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setStyle() {
        view.backgroundColor = .black
        
        bottomMenu.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.backgroundColor = .black
        }
        bottomHomeBtn.do {
            $0.setImage(.bottomHomeW, for: .normal)
            $0.imageView?.contentMode = .scaleAspectFit
        }
        bottomPreBtn.do {
            $0.setImage(.bottomPreG, for: .normal)
            $0.imageView?.contentMode = .scaleAspectFit
        }
        bottomSearchBtn.do {
            $0.setImage(.bottomSearchG, for: .normal)
            $0.imageView?.contentMode = .scaleAspectFit
        }
        bottomRecordBtn.do {
            $0.setImage(.bottomRecordG, for: .normal)
            $0.imageView?.contentMode = .scaleAspectFit
        }
    }
    
    override func sethirarchy() {
        view.addSubview(bottomMenu)
        
        bottomMenu.addArrangedSubviews(bottomHomeBtn,
                                       bottomPreBtn,
                                       bottomSearchBtn,
                                       bottomRecordBtn)
    }
    
    override func setLayout() {
        bottomMenu.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
