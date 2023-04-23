//
//  UILabel+.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/10.
//

import UIKit

extension UILabel {
    
    func asColor(targetString: String, color: UIColor?) {
        
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttributes([.font: font as Any, .foregroundColor: color as Any], range: range)
        attributedText = attributedString
    }
    
    func underLine(from text: String?, at range: String?) {
        
            guard let text = text,
                  let range = range else { return }
            
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttributes([NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue], range: NSString(string: text).range(of: range))
            self.attributedText = attributedString
        }

}
