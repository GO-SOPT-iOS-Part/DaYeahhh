//
//  MainView.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

class MainView: BaseView {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    // MARK: - style
    
    override func setStyle() {
        super.setStyle()
        
        collectionView.do {
            $0.register(MainViewContentsCell.self, forCellWithReuseIdentifier: MainViewContentsCell.identifier)
            $0.register(MainViewSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainViewSectionHeader.identifier)
            $0.register(MainViewPagingIndicator.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MainViewPagingIndicator.identifier)
            $0.backgroundColor = .black
            $0.contentInsetAdjustmentBehavior = .never
        }
    }
    
    // MARK: - layout
    
    override func setHierarchy() {
        self.addSubviews(collectionView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}




