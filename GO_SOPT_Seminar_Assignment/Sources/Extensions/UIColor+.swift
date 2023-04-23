//
//  UIColor+.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/11.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

extension UIColor {
    
    static var tvingRed: UIColor {
        return UIColor(r: 234, g: 51, b: 58)
    }
    static var tvingGray4: UIColor {
        return UIColor(r: 46, g: 46, b: 46)
    }
    static var tvingGray3: UIColor {
        return UIColor(r: 98, g: 98, b: 98)
    }
    static var tvingGray2: UIColor {
        return UIColor(r: 156, g: 156, b: 156)
    }
    static var tvingGray1: UIColor {
        return UIColor(r: 214, g: 214, b: 214)
    }
    
}
