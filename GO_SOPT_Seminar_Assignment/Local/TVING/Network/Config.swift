//
//  Config.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/05/12.
//

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let personalKey = "Personal_Key"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config {
    
    static let personalKey: String = {
        guard let key = Config.infoDictionary[Keys.Plist.personalKey] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return key
    }()
    
    static let baseURL: String = {
        let url = "https://api.themoviedb.org/3/movie/"
        return url
    }()
    
}
