//
//  MainBaseViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/05/04.
//

import UIKit

class MainBaseViewController: BaseViewController {

    weak var scrollDelegate: UIScrollViewDelegate?

}

extension MainBaseViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let scrollViewDidScroll = scrollDelegate?.scrollViewDidScroll else { return }
        scrollViewDidScroll(scrollView)
    }
}
