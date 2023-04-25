//
//  LabelNextBtnTableViewCell.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

class LabelNextBtnTableViewCell: UITableViewCell {
    
    // MARK: - Property

    static let identifier = "1LabelNxtBtnViewCell"
    
    private let label = UILabel()
    private let nextBtn = UIButton()
    
    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    func configCell(_ mainLabel: String){
        label.text = mainLabel
    }
    
}

private extension LabelNextBtnTableViewCell {
    
    // MARK: - Style, Hierarchy, Layout

    func setStyle() {
        
        contentView.backgroundColor = .black
        selectionStyle = .none

        label.do {
            $0.font = .tvingMedium(ofSize: 15)
            $0.textColor = .tvingGray2
        }
        nextBtn.do {
            $0.setImage(.nextImg, for: .normal)
            $0.imageView?.contentMode = .scaleAspectFit
        }
    }
    
    func setHierarchy() {
        contentView.addSubviews(label,
                                nextBtn)
    }
    
    func setLayout() {
        label.snp.makeConstraints {
            $0.height.equalTo(60)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
        }
        nextBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
    }
}
