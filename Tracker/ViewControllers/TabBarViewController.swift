//
//  ViewController.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 10.01.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
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
        
        let trackerViewController = TrackersViewController()
        let trackerNavigationController = UINavigationController(rootViewController: trackerViewController)

        trackerViewController.tabBarItem = UITabBarItem(title: "Трекеры",
                                                       image: UIImage(named: "tabBarTrackerIcon"),
                                                       selectedImage: nil
                                                       )
        trackerViewController.tabBarItem.accessibilityIdentifier = "TrackerView"

        let statisticViewController = StatisticsViewController()
        statisticViewController.tabBarItem = UITabBarItem(title: "Статистика",
                                                          image: UIImage(named: "tabBarStatisticLogo"),
                                                          selectedImage: nil
                                                          )
        statisticViewController.tabBarItem.accessibilityIdentifier = "StatisticView"

        self.viewControllers = [trackerNavigationController, statisticViewController]
    }
}
