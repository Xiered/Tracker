//
//  HabitCell.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 21.01.2024.
//

import UIKit

final class HabitCell: UITableViewCell {
    
    // MARK: - Variables
    static let reuseIdentifier = "HabitCell"
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(named: "YP Gray")
        imageView.image = UIImage(systemName: "chevron.right" )
        
        return imageView
    }()
    
    // MARK: - Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCell()
    }
    
    func setupCell() {
        textLabel?.font = UIFont.systemFont(ofSize: 17)
        textLabel?.textColor = UIColor(named: "YP Gray")
        
        layoutMargins = .zero
        separatorInset = .zero
        contentView.addSubview(arrowImageView)
        
        NSLayoutConstraint.activate([
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
