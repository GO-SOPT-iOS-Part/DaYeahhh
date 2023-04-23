//
//  UIFont+.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/12.
//

import UIKit

extension UIFont {
    
    static func tvingSemiBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-SemiBold", size: size)!
    }
    
    static func tvingMedium(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Medium", size: size)!
    }
    
    static func tvingRegular(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Regular", size: size)!
    }
}
