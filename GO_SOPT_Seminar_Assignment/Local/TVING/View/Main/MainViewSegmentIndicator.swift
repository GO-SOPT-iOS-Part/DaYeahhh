//
//  MainViewSegmentIndicator.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/05/03.
//

import UIKit

import SnapKit
import Then

class MainViewSegmentIndicator: UIView {
    
    private let trackView = UIView()
    private let trackTintView = UIView()
    
    private var leftInsetConstraint: Constraint?
    
    var width: CGFloat? {
        didSet {
            guard let width = self.width else { return }
            trackTintView.snp.updateConstraints {
                $0.width.equalTo(width)
            }
        }
    }
    var leftInset: CGFloat? {
        didSet {
            guard let leftInset = leftInset else { return }
            trackTintView.snp.updateConstraints {
                $0.leading.equalToSuperview().inset(leftInset)
            }
            UIView.animate(withDuration: 0.1, animations: {
                self.layoutIfNeeded()
            })
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
        trackView.do {
            $0.backgroundColor = .clear
        }
        trackTintView.do {
            $0.backgroundColor = .white
            $0.makeRounded(radius: 2)
        }
        
    }
    
    func setHierarchy() {
        self.addSubview(trackView)
        trackView.addSubview(trackTintView)
    }
    
    func setLayout() {
        trackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        trackTintView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(10)
        }
    }
}
