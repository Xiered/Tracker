//
//  HeaderCollectionReusableView.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 19.02.2024.
//

import UIKit

final class HeaderCollectionReusableView: UICollectionReusableView {
    
    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.textColor = UIColor(named: "YP Black (day)")
        headerLabel.font = .boldSystemFont(ofSize: 19)
        
        return headerLabel
    }()
    
    func configHeader(text: String) {
        headerLabel.text = text
        
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
