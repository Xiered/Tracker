//
//  IrregularEventViewController.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 21.01.2024.
//

import UIKit

protocol IrregularEventViewControllerDelegate: AnyObject {
    func addNewIrregular(_ trackerCategory: TrackerCategory)
}

// Controller for irregular event creating
final class IrregularEventViewController: UIViewController {
    
    // MARK: - Variables
    
    weak var delegate: IrregularEventViewControllerDelegate?
    
    private let irregularTextField: UITextField = {
        let irregularTextField = UITextField()
        irregularTextField.translatesAutoresizingMaskIntoConstraints = false
        irregularTextField.backgroundColor = UIColor(named: "YP Background (day)")
        irregularTextField.textColor = UIColor(named: "YP Black (day)")
        irregularTextField.clearButtonMode = .whileEditing
        irregularTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: irregularTextField.frame.height))
        irregularTextField.leftViewMode = .always
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(named: "YP Gray") as Any]
        irregularTextField.attributedPlaceholder = NSAttributedString(string: "Введите название трекера", attributes: attributes)
        irregularTextField.layer.masksToBounds = true
        irregularTextField.layer.cornerRadius = 16
        
        return irregularTextField
    }()
    
    private let irregularTableView: UITableView = {
        let irregularTableView = UITableView()
        irregularTableView.translatesAutoresizingMaskIntoConstraints = false
        irregularTableView.backgroundColor = UIColor(named: "YP White (day)")
        
        return irregularTableView
    }()
    
    private let cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setTitle("Отменить", for: .normal)
        cancelButton.setTitleColor(UIColor(named: "YP Red"), for: .normal)
        cancelButton.layer.borderColor = UIColor(named: "YP Red")?.cgColor
        cancelButton.layer.borderWidth = 2.0
        cancelButton.backgroundColor = .clear
        cancelButton.layer.cornerRadius = 16
        cancelButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cancelButton.addTarget(nil, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        return cancelButton
    }()
    
    private let createIrregular: UIButton = {
        let createIrregularButton = UIButton()
        createIrregularButton.translatesAutoresizingMaskIntoConstraints = false
        createIrregularButton.setTitle("Создать", for: .normal)
        createIrregularButton.setTitleColor(UIColor(named: "YP White (day)"), for: .normal)
        createIrregularButton.backgroundColor = UIColor(named: "YP Gray")
        createIrregularButton.layer.cornerRadius = 16
        createIrregularButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        createIrregularButton.isEnabled = false
        createIrregularButton.addTarget(nil, action: #selector(createIrregularButtonTapped), for: .touchUpInside)
        
        return createIrregularButton
    }()
    
    private var category: String?
    private var chosenCategoryIndex: Int?
    private var chosenDays: [Int] = Array(0...6)
    
    // MARK: - Methods
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func createIrregularButtonTapped() {
        let text: String = irregularTextField.text ?? ""
        let category: String = category ?? ""
        if let delegate = delegate {
            delegate.addNewIrregular(TrackerCategory(header: category, trackersArray: [Tracker(id: UUID(), name: text, color: UIColor(named: "Color selection 5") ?? .green, emoji: "❤️", schedule: chosenDays)]))
        } else {
            print("Delegate error")
        }
        dismiss(animated: true)
    }
    
    private func checkButtonAccessibility() {
        if let text = irregularTextField.text,
           !text.isEmpty,
           category != nil {
            createIrregular.isEnabled = true
            createIrregular.backgroundColor = UIColor(named: "YP Black (day)")
            createIrregular.setTitleColor(UIColor(named: "YP White (day)"), for: .normal)
        } else {
            createIrregular.isEnabled = true
            createIrregular.backgroundColor = UIColor(named: "YP Gray")
        }
           
    }
    
    private func setupIrregularLayout() {
        navigationItem.title = "Новое нерегулярное событие"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "YP Black (day)")]
        navigationItem.hidesBackButton = true
        
        irregularTableView.dataSource = self
        irregularTableView.delegate = self
        irregularTableView.register(IrregularEventCell.self, forCellReuseIdentifier: IrregularEventCell.reuseIdentifier)
        irregularTableView.separatorColor = UIColor(named: "YP Gray")
        irregularTableView.separatorStyle = .singleLine
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //  irregularTextField.delegate = self
        view.backgroundColor = UIColor(named: "YP White (day)")
        setupIrregularLayout()
    }
}
/*
extension IrregularEventViewController: UITableViewDelegate {
    
}

extension IrregularEventViewController: UITableViewDataSource {
    
}

extension IrregularEventViewController: UITextFieldDelegate {
    
}

extension IrregularEventViewController: CategoryViewControllerDelegate {
    
}
*/
