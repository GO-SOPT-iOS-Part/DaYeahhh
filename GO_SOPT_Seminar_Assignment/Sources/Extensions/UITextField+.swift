//
//  UITextField+.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/11.
//

import UIKit

public extension UITextField {
    
    // Placeholder 색상
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
    
    // 좌우 여백
    func setLeftRightPadding(leftPadding: Double = 22.0, rightPadding: Double = 22.0) {
        let leftPaddingView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: leftPadding, height: 0.0))
        let rightPaddingView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: rightPadding, height: 0.0))
        
        self.leftView = leftPaddingView
        self.rightView = rightPaddingView
        
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
    
}
