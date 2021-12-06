//
//  NumberCell.swift
//  CollectionViewTest
//
//  Created by TK_User on 06.12.2021.
//

import SnapKit

class NumberCell: UICollectionViewCell {
    
  var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        embedViews()
        setupLayout()
        setupAppereance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func embedViews() {
        contentView.addSubview(label)
    }
    
    private func setupLayout() {
        label.snp.makeConstraints {make in
            make.centerY.centerX.equalToSuperview()
        }
    }
    
    private func setupAppereance() {
        contentView.backgroundColor = .magenta
    }
}
