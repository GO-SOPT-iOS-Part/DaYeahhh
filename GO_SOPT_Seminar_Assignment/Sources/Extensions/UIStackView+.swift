//
//  UIStackView+.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        
        views.forEach {
            self.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
