//
//  MainViewPagingIndicatorView.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/05/02.
//

import UIKit

class MainViewPagingIndicator: UICollectionReusableView {
    
    static let identifier = "MainViewHeaderPagingFooter"
    
    private let pageControl = UIPageControl()
    
    var currentPage: Int = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    var numberOfPages: Int = 0 {
        didSet {
            pageControl.numberOfPages = numberOfPages
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        pageControl.do {
            $0.hidesForSinglePage = true
            $0.pageIndicatorTintColor = .tvingGray3
            $0.currentPageIndicatorTintColor = .tvingGray1
            $0.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
    }
    
    func setHierarchy() {
        self.addSubviews(pageControl)
    }
    func setLayout() {
        pageControl.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
        }
    }
}

extension MainViewPagingIndicator: dataBindProtocol {
    func dataBind(num: Int) {
        currentPage = num
        print(num)
    }
}
