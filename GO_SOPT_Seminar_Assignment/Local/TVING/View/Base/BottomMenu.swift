//
//  BottomMenu.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/05/03.
//

import UIKit

class BottomMenu: UIView {

    let bottomMenu = UIStackView()
    let bottomHomeBtn = UIButton()
    let bottomPreBtn = UIButton()
    let bottomSearchBtn = UIButton()
    let bottomRecordBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .black
        
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
    private func setHierarchy() {
        self.addSubview(bottomMenu)
        
        bottomMenu.addArrangedSubviews(bottomHomeBtn,
                                       bottomPreBtn,
                                       bottomSearchBtn,
                                       bottomRecordBtn)
    }
    private func setLayout() {
        bottomMenu.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        bottomHomeBtn.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
        }
        bottomPreBtn.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
        }
        bottomSearchBtn.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
        }
        bottomRecordBtn.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
        }
    }
}
