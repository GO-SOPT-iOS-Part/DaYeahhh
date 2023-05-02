//
//  MainView.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

protocol dataBindProtocol: AnyObject {
    func dataBind(num: Int)
}

class MainView: BaseView {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let dummy = Contents.dummy()
    weak var delegate: dataBindProtocol?
    
    private func createLayout() -> UICollectionViewLayout {
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 30
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let sectionLayout = ContentsSectionLayout(rawValue: Contents.sectionLayout()[sectionIndex]) else {return nil}
            
            let itemSize = sectionLayout.itemSize
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            section.orthogonalScrollingBehavior = sectionLayout.orthogonalScrollinBehavior
            section.interGroupSpacing = sectionLayout.interGroupSpacing
            section.boundarySupplementaryItems = sectionLayout.header
            section.boundarySupplementaryItems += sectionLayout.footer
            
            return section
        }, configuration: config)
        
        return layout
    }
    
    // MARK: - style
    
    override func setStyle() {
        super.setStyle()
        
        collectionView.do {
            $0.register(MainViewContentsCell.self, forCellWithReuseIdentifier: MainViewContentsCell.identifier)
            $0.register(MainViewSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainViewSectionHeader.identifier)
            $0.register(MainViewPagingIndicator.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MainViewPagingIndicator.identifier)
            $0.collectionViewLayout = createLayout()
            $0.backgroundColor = .black
            $0.delegate = self
            $0.dataSource = self
            $0.contentInsetAdjustmentBehavior = .never
        }
    }
    
    // MARK: - layout
    
    override func setHierarchy() {
        self.addSubviews(collectionView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(52)
        }
    }
}
extension MainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay: UICollectionViewCell, forItemAt: IndexPath){
        if forItemAt.section == 0 {
            delegate?.dataBind(num: forItemAt.row)
        }
    }
}
extension MainView: UICollectionViewDataSource {
    
    // section 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummy[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewContentsCell.identifier, for: indexPath) as? MainViewContentsCell else { return UICollectionViewCell()}
        cell.configureCell(dummy[indexPath.section][indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{ // 헤더일때
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainViewSectionHeader.identifier, for: indexPath) as? MainViewSectionHeader else {return UICollectionReusableView()}
            header.mainLabel.text = Contents.sectionName()[indexPath.section]
            return header
        } else {
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainViewPagingIndicator.identifier, for: indexPath) as? MainViewPagingIndicator else {return UICollectionReusableView()}
            footer.numberOfPages = dummy[indexPath.section].count
            self.delegate = footer
            return footer
        }
    }
}


