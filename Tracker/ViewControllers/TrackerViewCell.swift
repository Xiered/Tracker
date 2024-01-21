//
//  TrackerViewCell.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 21.01.2024.
//

import UIKit

final class TrackerViewCell: UIViewController {
    private var viewModel: CellModel?
    // MARK: - Properties
    // Substrate with color
    private let cardBackground: UIView = {
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 16
        return cardView
    }()
    // Emoji
    private let emojiLabel: UILabel = {
        let emojiLabel = UILabel()
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.layer.masksToBounds = true
        emojiLabel.layer.cornerRadius = 12
        emojiLabel.textAlignment = .center
        emojiLabel.font = UIFont.systemFont(ofSize: 16)
        return emojiLabel
    }()
    // Task label
    private let taskLabel: UILabel = {
        let taskLabel = UILabel()
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.textColor = UIColor(named: "YP White (day)")
        taskLabel.font = UIFont.systemFont(ofSize: 12)
        return taskLabel
    }()
    // Label with day count
    private let dayCountLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.textColor = UIColor(named: "YP Black (day)")
        dayLabel.font = UIFont.systemFont(ofSize: 12)
        return dayLabel
    }()
    // Approve button
    private let checkButton: UIButton = {
        let checkButton = UIButton()
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.tintColor = UIColor(named: "YP White (day)")
        checkButton.backgroundColor = UIColor(named: "Color selection 5")
        checkButton.layer.masksToBounds = true
        checkButton.layer.cornerRadius = 16
        checkButton.imageView?.contentMode = .scaleAspectFill
        // addTarget
        return checkButton
    }()
    
    // MARK: - Methods
    func configureCell(viewModel: CellModel) {
        
    }
    
    private func configureCustomCell() {
        
    }
}
