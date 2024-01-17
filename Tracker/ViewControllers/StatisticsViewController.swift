//
//  StatisticsViewController.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 11.01.2024.
//

import UIKit

final class StatisticsViewController: UIViewController {
    
    // MARK: - Variables
    
    static let shared = StatisticsViewController() // Singleton pattern
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStatisticsVC()
    }
    
    private func configureStatisticsVC() {
        view.backgroundColor = UIColor(named: "YP White (day)")
    }
}
