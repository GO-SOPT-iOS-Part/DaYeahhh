//
//  Contents.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/29.
//

import UIKit

struct Contents {
    var image: UIImage? = nil
    var imageLink: String? = nil
    var name: String? = nil
    var subName: String? = nil
    let sectionNum: Int
}

extension Contents {
    static func dummy() -> [[Contents]] {
        let contents = [[Contents(image: .main1, sectionNum: 0),
                         Contents(image: .main2, sectionNum: 0),
                         Contents(image: .main3, sectionNum: 0),
                         Contents(image: .main4, sectionNum: 0)],
                        [],
                        [Contents(image: .banner1, sectionNum: 3),
                         Contents(image: .banner2, sectionNum: 3),
                         Contents(image: .banner3, sectionNum: 3)],
                        [Contents(image: .live1, name: "tvN Show", subName: "신서유기5 10화\n24.3%", sectionNum: 4),
                         Contents(image: .live2, name: "JTBC", subName: "JTBC 뉴스\n10.7%", sectionNum: 4),
                         Contents(image: .live3, name: "tvN", subName: "부산 촌놈 3화\n7.4%", sectionNum: 4)],
                        [Contents(image: .paramount1, name: "그리스: 라이즈 오브 핑크 레이디스", sectionNum: 5),
                         Contents(image: .paramount2, name: "옐로우재킷 시즌2", sectionNum: 5),
                         Contents(image: .paramount3, name: "래빗홀", sectionNum: 5),
                         Contents(image: .paramount4, name: "메이어 오브 킹스타운", sectionNum: 5),
                         Contents(image: .paramount5, name: "1923", sectionNum: 5)]]
        
        return contents
    }
    
    static func sectionName() -> [String] {
        return ["", "티빙에서 꼭 봐야하는 콘텐츠", "", "인기 LIVE 채널", "파라마운트+의 따끈한 신작"]
    }
    
    static func sectionLayout() -> [String] {
        return ["Header", "Normal", "Banner", "Live", "Normal"]
    }
}
