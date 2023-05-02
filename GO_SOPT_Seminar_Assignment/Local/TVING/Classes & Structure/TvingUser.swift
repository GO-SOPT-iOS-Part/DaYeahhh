//
//  TvingUser.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/28.
//

import Foundation

class TvingUser {
    
    var id: String?
    var password: String?
    var nickName: String?
    
    func getNickNameOrId() -> String {
        if let nickName = self.nickName {
            return nickName
        } else {
            guard let id = self.id?.components(separatedBy: "@").first else { return "" }
            return id
        }
    }
}
