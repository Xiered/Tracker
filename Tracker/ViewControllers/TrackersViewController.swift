//
//  TrackersViewController.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 11.01.2024.
//

import UIKit

final class TrackersViewController: UIViewController {
    static let shared = TrackersViewController()
    
    // Creating "plus" button
    // Creating image placeholder
    // Creating textField
    // Creating date with datePicker
    // Creating label
    // Creating second label
    
    
   
    
    // Поле ввода
    private let searchTexField: UISearchTextField = {
        let searchField = UISearchTextField()
        searchField.backgroundColor = UIColor(named: "YP Gray")
        searchField.placeholder = "Поиск"
        searchField.translatesAutoresizingMaskIntoConstraints = false
        
        return searchField
    }()
    
    // Изображение с ошибкой
    private let placeholderImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "trackersPlaceholder")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            placeholderImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeholderImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }

    private func addSubview() {
        view.addSubview(placeholderImage)
        view.addSubview(searchTexField)
    }
    
    private func configureParentalView() {
        view.backgroundColor = UIColor(named: "YP White (day)")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureParentalView()
        addSubview()
        setupLayout()
    }
}
