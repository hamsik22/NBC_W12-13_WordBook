//
//  WordBookCollectionCell.swift
//  SwiftRun
//
//  Created by 황석현 on 1/8/25.
//

import UIKit
import SnapKit

class WordBookCollectionCell: UICollectionViewCell {
    
    static let identifier = "wordBookCollectionCell"
    
    let wordBookTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor.blue.cgColor
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(wordBookTitle)
        
        wordBookTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: Category) {
        wordBookTitle.text = item.name
    }
}

@available(iOS 17.0, *)
#Preview("HomeViewController") {
    HomeViewController()
}
