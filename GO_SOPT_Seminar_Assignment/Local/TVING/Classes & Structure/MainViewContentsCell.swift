//
//  ContentsCollectionViewCell.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/29.
//

import UIKit

import Kingfisher

class MainViewContentsCell: UICollectionViewCell {
    
    static let identifier = "ContentsCell"
    
    private let contentsStackView = UIStackView()
    private let contentsImg = UIImageView()
    private let contentsName = UILabel()
    private let contentsSubName = UILabel()
    
    var pageIndicatorNum: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainViewContentsCell {
    
    func setStyle() {
        contentsStackView.do {
            $0.axis = .vertical
            $0.distribution = .fill
        }
        contentsImg.do {
            $0.contentMode = .scaleAspectFit
        }
        contentsName.do {
            $0.font = .tvingMedium(ofSize: 12)
            $0.textColor = .tvingGray2
        }
        contentsSubName.do {
            $0.font = .tvingRegular(ofSize: 10)
            $0.textColor = .tvingGray2
            $0.numberOfLines = 2
        }
    }
    
    func setHierarchy() {
        contentView.addSubviews(contentsStackView)
        contentsStackView.addArrangedSubviews(contentsImg,
                                              contentsName,
                                              contentsSubName)
    }
    
    func setLayout() {
        contentsStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentsImg.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        contentsName.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.leading.trailing.equalToSuperview()
        }
        contentsSubName.snp.makeConstraints {
            $0.height.equalTo(25)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func configureCell(_ contents: Contents) {
        
        if let img = contents.image {
            contentsImg.image = img
        }
        if let imgLink = contents.imageLink {
            contentsImg.kf.setImage(with: URL(string: imgLink))
        }
        contentsName.text = contents.name
        contentsSubName.text = contents.subName
        
        if (contentsName.text == nil) {
            contentsName.isHidden = true
        } else {
            contentsName.isHidden = false
        }
        if (contentsSubName.text == nil) {
            contentsSubName.isHidden = true
        } else {
            contentsSubName.isHidden = false
        }
    }
}

