//
//  HabitViewController.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 21.01.2024.
//

import UIKit

protocol HabitViewControllerDelegate: AnyObject {
    func addNewHabit(_ trackerCategory: TrackerCategory)
}

// Controller for habit creating
final class HabitViewController: UIViewController {
    
    // MARK: - Variables
    weak var delegate: HabitViewControllerDelegate?
    
    private let habitTextField: UITextField = {
        let habitTextField = UITextField()
        habitTextField.translatesAutoresizingMaskIntoConstraints = false
        habitTextField.layer.masksToBounds = true
        habitTextField.layer.cornerRadius = 16
        habitTextField.backgroundColor = UIColor(named: "YP Background (day)")
        habitTextField.textColor = UIColor(named: "Black (day)")
        
        return habitTextField
    }()
    
    private let habitTableView: UITableView = {
        let habitTableView = UITableView()
        habitTableView.translatesAutoresizingMaskIntoConstraints = false
        habitTableView.backgroundColor = UIColor(named: "YP White (day)")
        
        return habitTableView
    }()
    
    
    // MARK: - Methods
}
