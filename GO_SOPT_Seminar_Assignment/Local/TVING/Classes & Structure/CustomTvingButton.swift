//
//  TvingButton.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

class CustomTvingButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        self.setTitleColor(.tvingGray2, for: .normal)
        self.titleLabel?.textAlignment = .center
        self.layer.borderColor = UIColor.tvingGray4.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 3
    }
    
    func setLayout() {
    
    }
}
