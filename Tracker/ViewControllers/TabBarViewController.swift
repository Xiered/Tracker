//
//  ViewController.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 10.01.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    // MARK: - Variables
    
    private let trackersVC = TrackersViewController.shared // Using singlton pattern
    private let statisticsVC = StatisticsViewController.shared // Same like trackersVC
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeTabBarViewController() // Calling creating TabBarVeiwController method
    }
    
    private func makeTabBarViewController() { // Method for creating TabBarViewController
        tabBar.backgroundColor = UIColor(named: "YP White (day)")
        tabBar.tintColor = UIColor(named: "YP Blue")
        tabBar.barTintColor = UIColor(named: "YP Blue")
        tabBar.isTranslucent = true
        tabBar.clipsToBounds = true
        
        let _ = UINavigationController(rootViewController: trackersVC)
        
        trackersVC.tabBarItem = UITabBarItem(title: "Трекеры",
                                             image: UIImage(named: "tabBarTrackerIcon"),
                                             selectedImage: nil)
        
        let _ = UINavigationController(rootViewController: statisticsVC)
        
        statisticsVC.tabBarItem = UITabBarItem(title: "Статистика",
                                               image: UIImage(named: "tabBarStatisticLogo"),
                                               selectedImage: nil)
        
        self.viewControllers = [trackersVC, statisticsVC]
    }
    
}

