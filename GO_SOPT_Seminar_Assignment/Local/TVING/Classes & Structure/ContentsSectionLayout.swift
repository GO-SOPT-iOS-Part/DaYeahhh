//
//  MainViewSection.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/05/01.
//

import UIKit

@frozen
enum ContentsSectionLayout: String {
    
    case header = "Header"
    case normal = "Normal"
    case live = "Live"
    case banner = "Banner"
    
    var itemSize: NSCollectionLayoutSize {
        switch self {
        case .header:
            return NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0) ,heightDimension: .absolute(520))
        case .normal:
            return NSCollectionLayoutSize(widthDimension: .absolute(98) ,heightDimension: .absolute(160))
        case .live:
            return NSCollectionLayoutSize(widthDimension: .absolute(160) ,heightDimension: .absolute(140))
        case .banner:
            return NSCollectionLayoutSize(widthDimension: .absolute(300) ,heightDimension: .absolute(100))
        }
    }
    
    var interGroupSpacing: CGFloat {
        switch self {
        case .header:
            return 0
        default:
            return 10
        }
    }
    
    var orthogonalScrollinBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior {
        switch self {
        case .header:
            return .groupPaging
        default:
            return .continuous
        }
    }
    
    var header: [NSCollectionLayoutBoundarySupplementaryItem] {
        switch self {
        case .normal, .live:
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            return [header]
        default:
            return []
        }
    }
    
    var footer: [NSCollectionLayoutBoundarySupplementaryItem] {
        switch self {
        case .header:
            let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(20))
            let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
            return [footer]
        default:
            return []
        }
    }
    
}
