//
//  MypageMenu.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/26.
//

import Foundation

import UIKit

struct MyPageMenu {
    let menuName: String
}

extension MyPageMenu {
    
    static func dummy() -> [[MyPageMenu]] {
        return [[MyPageMenu(menuName: "이용권"),
                 MyPageMenu(menuName: "1:1 문의내역"),
                 MyPageMenu(menuName: "예약알림"),
                 MyPageMenu(menuName: "회원정보 수정"),
                 MyPageMenu(menuName: "프로모션 정보 수신 동의")],
                [MyPageMenu(menuName: "공지사항"),
                 MyPageMenu(menuName: "이벤트"),
                 MyPageMenu(menuName: "고객센터"),
                 MyPageMenu(menuName: "티빙 알아보기")]]
    }
}

