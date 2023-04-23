//
//  String+.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/17.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let pattern = "^[0-9a-zA-Z!@#$%^&*()-=+]*$"
        guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
        return true
    }
    
    func isValidNickName() -> Bool {
        let pattern = "^[가-힣ㄱ-ㅎㅏ-ㅣ]*$"
        guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
        return true
    }

}
