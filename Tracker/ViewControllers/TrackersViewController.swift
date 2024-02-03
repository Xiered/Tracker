//
//  TrackersViewController.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 11.01.2024.
//

import UIKit

final class TrackersViewController: UIViewController {
    
    // MARK: - Variables
    
    static let shared = TrackersViewController() // Singleton pattern
    static var selectedDate: Date?
    private var categories: [TrackerCategory] = []
    private var completedTrackers: [TrackerRecord] = []
    private var newCategories: [TrackerCategory] = []
    private var currentDate: Date = Date()

    // MARK: - Layout components
    
    private let header: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
  
    private let largeTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Трекеры"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = UIColor(named: "YP Black (day)")
        
        return label
    }()
    
    private let searchTextField: UISearchTextField = {
        let searchView = UISearchTextField()
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.backgroundColor = UIColor(named: "YP Light Gray")
        searchView.placeholder = "Поиск"
        
        return searchView
    }()
    
    private let imageWithError: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "trackersPlaceholder")
        
        return image
    }()
    
    private let textUnderImageError: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Что будем отслеживать?"
        label.font = UIFont(name: "SF Pro Text Regular", size: 12)
        
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor(named: "YP Black (day)")
        button.setImage(UIImage(named: "plusButtonImage"), for: .normal)
        
        return button
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        
        return datePicker
    }()
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }()
    
    // MARK: - CollectionView
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Methods
    
    private func setupLayout() {
        
        view.backgroundColor = UIColor(named: "YP White (day)") // Background for parent view
        view.addSubview(header)
        view.addSubview(largeTitle)
        view.addSubview(searchTextField)
        view.addSubview(imageWithError)
        view.addSubview(textUnderImageError)
        view.addSubview(plusButton)
        view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            header.heightAnchor.constraint(equalToConstant: 140),
            
            plusButton.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 2),
            plusButton.topAnchor.constraint(equalTo: header.topAnchor),
        
            largeTitle.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            largeTitle.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 21),
            
            searchTextField.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -10),
            searchTextField.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            
            imageWithError.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageWithError.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 220),
            
            textUnderImageError.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textUnderImageError.topAnchor.constraint(equalTo: imageWithError.bottomAnchor, constant: 8),
            
            datePicker.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            datePicker.centerYAnchor.constraint(equalTo: largeTitle.centerYAnchor),
            datePicker.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func configureNavBar() {
        
    }
    
    private func configureCollectionView() {
        
    }
    
    private func reloadPlaceholder() {
        
    }
    
    private func configureViewModel() {
        
    }
    
    private func reloadVisibleCategories() {
        
    }
    
    @objc private func addTracker() {
        
    }
    
    @objc private func datePickerChange() {
        
    }
    
    @objc private func cancelSearch() {
        
    }
    
}

/*
 
 extension TrackerViewCellDelegate
 
 extension UICollectionViewDelegate
 
 extension UICollectionViewDelegateFlowLayout
 
 extension UICollectionViewDataSource
 
 extension HabitViewControllerDelegate
 
 extension IrregularEventViewController
 
 */
