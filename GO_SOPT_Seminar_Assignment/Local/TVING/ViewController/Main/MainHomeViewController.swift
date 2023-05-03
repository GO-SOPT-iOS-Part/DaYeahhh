//
//  MainHomeViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/05/03.
//

import UIKit

import SnapKit
import Then

protocol dataBindProtocol: AnyObject {
    func dataBind(page: Int)
}

class MainHomeViewController: MainBaseViewController {
    
    // MARK: - Property
    
    private let mainView = MainView()
    
    private let dummy = Contents.dummy()
    private var mainPagingPage: Int = 0
    
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
            
            if sectionLayout.rawValue == "Header" {
                section.visibleItemsInvalidationHandler = { visibleItems, scrollOffset, layoutEnvironment in
                    self.mainPagingPage = Int(scrollOffset.x / (self.view.frame.width * sectionLayout.itemSize.widthDimension.dimension))
                }
            }
            return section
        }, configuration: config)
        
        return layout
    }
    
    // MARK: - Target
    
    private func target() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.collectionViewLayout = createLayout()
        
    }
    
    // MARK: - Lift Cycle
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }
}

extension MainHomeViewController: UICollectionViewDataSource {
    
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

extension MainHomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying: UICollectionViewCell, forItemAt: IndexPath) {
        if forItemAt.section == 0 {
            delegate?.dataBind(page: mainPagingPage)
        }
    }
}

