//
//  TrackersViewController.swift
//  Tracker
//
//  Created by Дмитрий Герасимов on 11.01.2024.
//

import UIKit

final class TrackersViewController: UIViewController {
    
    enum PlaceholdersType {
        case noTrackers
        case notFoundTrackers
    }
    
    // MARK: - Variables
    
    static let shared = TrackersViewController() // Singleton pattern
    static var selectedDate: Date?
    private var categories: [TrackerCategory] = []
    private var completedTrackers: Set<TrackerRecord> = []
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
    
    private let cancelSearchButton: UIButton = {
        let cancelSearchButton = UIButton()
        cancelSearchButton.translatesAutoresizingMaskIntoConstraints = false
        cancelSearchButton.setTitle("Отменить", for: .normal)
        cancelSearchButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        cancelSearchButton.setTitleColor(UIColor(named: "YP Blue"), for: .normal)
        cancelSearchButton.addTarget(nil, action: #selector(cancelSearchButtonTapped), for: .touchUpInside)
        
        return cancelSearchButton
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
    
    private let imagePlaceholder: UIImageView = {
        let imagePlaceholder = UIImageView()
        imagePlaceholder.translatesAutoresizingMaskIntoConstraints = false
        imagePlaceholder.isHidden = false
        
        return imagePlaceholder
    }()

    private let textPlaceholder: UILabel = {
        let textPlaceholder = UILabel()
        textPlaceholder.translatesAutoresizingMaskIntoConstraints = false
        textPlaceholder.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        textPlaceholder.textColor = UIColor(named: "YP Black (day)")
        textPlaceholder.isHidden = false
        
        return textPlaceholder
    }()
    
    private let searchStackView: UIStackView = {
        let searchStackView = UIStackView()
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.axis = .horizontal
        searchStackView.spacing = 8
        return searchStackView
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
            
          //  plusButton.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 2),
          //  plusButton.topAnchor.constraint(equalTo: header.topAnchor),
        
            largeTitle.leadingAnchor.constraint(equalTo: header.leadingAnchor),
           // largeTitle.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 21),
            
            searchTextField.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -10),
            searchTextField.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            
            imageWithError.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageWithError.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 220),
            
            textUnderImageError.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textUnderImageError.topAnchor.constraint(equalTo: imageWithError.bottomAnchor, constant: 8),
            
            datePicker.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            datePicker.centerYAnchor.constraint(equalTo: largeTitle.centerYAnchor),
            datePicker.widthAnchor.constraint(equalToConstant: 100),
            
            cancelSearchButton.widthAnchor.constraint(equalToConstant: 83)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureCollectionView()
        setupLayout()
        reloadPlaceholder(for: .noTrackers)
        datePickerValueChanged(datePicker)
    }
    
    private func configureNavBar() {
        let leftButton = UIBarButtonItem(image: UIImage(named: "plusButtonImage"), style: .done, target: self, action: #selector(addTrackerButtonTapped))
        leftButton.tintColor = UIColor(named: "YP Black (day)")
        
        let rightButton = UIBarButtonItem(customView: datePicker)
    
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        
        navigationItem.title = "Трекеры"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(TrackerViewCell.self, forCellWithReuseIdentifier: "Cell")
        
    }
    
    private func reloadPlaceholder(for type: PlaceholdersType) {
        if newCategories.isEmpty {
            imagePlaceholder.isHidden = false
            textPlaceholder.isHidden = false
            switch type {
                
            case .noTrackers:
                imagePlaceholder.image = UIImage(named: "trackersPlaceholder")
                textPlaceholder.text = "Что будем отслеживать"
                
            case .notFoundTrackers:
                imagePlaceholder.image = UIImage(named: "notFountPlaceholder")
                textPlaceholder.text = "Ничего не найдено"
            }
        } else {
            imagePlaceholder.isHidden = true
            textPlaceholder.isHidden = true
        }
    }
        
    private func reloadVisibleCategories() {
        
        currentDate = datePicker.date
        let calendar = Calendar.current
        let filterDayOfWeek = calendar.component(.weekday, from: currentDate) - 1
        let filterText = (searchTextField.text ?? "").lowercased()

        newCategories = categories.compactMap { category in
            let trackers = category.trackersArray.filter { tracker in
                let textCondition = filterText.isEmpty ||
                tracker.name.lowercased().contains(filterText)
                let dateCondition = tracker.schedule.contains(where: {$0 == filterDayOfWeek})
                return textCondition && dateCondition
            }
            if trackers.isEmpty {
                return nil
            }
            return TrackerCategory(
                header: category.header,
                trackersArray: trackers
            )
        }
        collectionView.reloadData()
        reloadPlaceholder(for: .noTrackers)
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        TrackersViewController.selectedDate = sender.date
        reloadVisibleCategories()
    }
    
    @objc private func addTrackerButtonTapped() {
        let habitVC = HabitViewController()
        habitVC.delegate = self
        let irregularEventVC = IrregularEventViewController()
        irregularEventVC.delegate = self
        
        let newTrackerTypeViewController = HabitOrIrregularViewController(newHabitViewController: habitVC, newIrregularEventViewController: irregularEventVC)
        let modalNavigationController = UINavigationController(rootViewController: newTrackerTypeViewController)
        navigationController?.present(modalNavigationController, animated: true)
    }
    
    @objc private func cancelSearchButtonTapped() {
        searchTextField.text = ""
        searchTextField.resignFirstResponder()
        datePickerValueChanged(datePicker)
        reloadPlaceholder(for: .noTrackers)
        cancelSearchButton.removeFromSuperview()
    }
    
    private func configViewModel(for indexPath: IndexPath) -> CellModel {
        let tracker = newCategories[indexPath.section].trackersArray[indexPath.row]
        let counter = completedTrackers.filter({$0.id == tracker.id}).count
        let trackerIsChecked = completedTrackers.contains(TrackerRecord(id: tracker.id, date: dateFormatter.string(from: currentDate)))
        _ = Calendar.current.compare(currentDate, to: Date(), toGranularity: .day)
        let checkButtonEnable = true
        return CellModel(tracker: tracker, dayCount: counter, buttonIsEnabled: checkButtonEnable, buttonIsChecked: trackerIsChecked, indexPath: indexPath)
    }
    
}

extension TrackersViewController: UICollectionViewDelegate{
    
}

extension TrackersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 167, height: 148)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let indexPath = IndexPath(item: 0, section: section)
        if newCategories[indexPath.section].trackersArray.count == 0 {
            return CGSizeZero
        }
        let headerView = self.collectionView(
            collectionView,
            viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader,
            at: indexPath)

        return headerView.systemLayoutSizeFitting(
            CGSize(width: collectionView.frame.width,
                   height: UIView.layoutFittingExpandedSize.height),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel)
    }
}

extension TrackersViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return newCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = newCategories[section].trackersArray.count
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TrackerViewCell
        cell.delegate = self
        let viewModel = configViewModel(for: indexPath)
        cell.configureCell(viewModel: viewModel)
        return cell
    }
// TODO: - HeaderCollection
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? HeaderCollectionReusableView
        headerView?.configHeader(text: newCategories[indexPath.section].header)
        return headerView ?? UICollectionReusableView()
    }
}

extension TrackersViewController: UITextFieldDelegate {
    // TODO: - Field search
}

extension TrackersViewController:TrackerViewDelegate {
    func dayCheckButtonTapped(viewModel: CellModel) {
        
        if viewModel.buttonIsChecked {
            completedTrackers.insert(TrackerRecord(id: viewModel.tracker.id, date: dateFormatter.string(from: currentDate)))
        } else {
            completedTrackers.remove(TrackerRecord(id: viewModel.tracker.id, date: dateFormatter.string(from: currentDate)))
        }
        collectionView.reloadItems(at: [viewModel.indexPath])
    }
}

extension TrackersViewController: HabitViewControllerDelegate {
    func addNewHabit(_ trackerCategory: TrackerCategory) {
        var newCategories: [TrackerCategory] = []
        
        if let categoryIndex = categories.firstIndex(where: { $0.header == trackerCategory.header }) {
            for (index, category) in categories.enumerated() {
                var trackers = category.trackersArray
                if index == categoryIndex {
                    trackers.append(contentsOf: trackerCategory.trackersArray)
                }
                newCategories.append(TrackerCategory(header: category.header, trackersArray: trackers))
            }
        } else {
            newCategories = categories
            newCategories.append(trackerCategory)
            print(newCategories)
        }
        categories = newCategories
        datePickerValueChanged(datePicker)
        collectionView.reloadData()
    }
}

extension TrackersViewController: IrregularEventViewControllerDelegate {
    func addNewIrregular(_ trackerCategory: TrackerCategory) {
        var newCategories: [TrackerCategory] = []

        if let categoryIndex = categories.firstIndex(where: { $0.header == trackerCategory.header }) {
            for (index, category) in categories.enumerated() {
                var trackers = category.trackersArray
                if index == categoryIndex {
                    trackers.append(contentsOf: trackerCategory.trackersArray)
                }
                newCategories.append(TrackerCategory(header: category.header, trackersArray: trackers))
            }
        } else {
            newCategories = categories
            newCategories.append(trackerCategory)
            print(newCategories)
        }
        categories = newCategories
        datePickerValueChanged(datePicker)
        collectionView.reloadData()
    }
}

extension TrackersViewController: UITextField {
    
}
