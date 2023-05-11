//
//  BaseView.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/22.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        self.backgroundColor = .black
    }
    func setHierarchy() {}
    func setLayout() {}
}
