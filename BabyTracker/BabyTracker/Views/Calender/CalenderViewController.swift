//
//  CalenderViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 16.03.2023.
//

//FIXME: - TableView Ekle - Custom Cell yaz
//viewdidload'ta tek tek her özelliğin datasını core'dan çek


import UIKit
import SnapKit
import CoreData

class CalenderViewController: UIViewController {
    
    //viewdidload'ta tek tek her özelliğin datasını core'dan çek ve servis olarak ya da data tut
    
    //MARK: - Properties
    var homeData = HomeViewController()
    var feedingData = [String]()
    var allData = [String]()
    var diaperData = [String]()
    var sleepData = [String]()
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Tue, Feb 12"
        title.font = .systemFont(ofSize: 20, weight: .medium)
        return title
    }()
    lazy var titleAllButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_unselected_all")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.setImage(UIImage(named: "img_selected_all")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(handleAllButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var feedingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_unselected_feeding")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.setImage(UIImage(named: "img_selected_feeding")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(handleFeedingButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    lazy var diaperButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_unselected_diaperc")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.setImage(UIImage(named: "img_selected_diaperc")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(handleDiaperButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    lazy var sleepButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_unselected_sleep")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.setImage(UIImage(named: "img_selected_sleep")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(handleSleepButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = true
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.rowHeight = 120
        return tableView
    }()
    
    //MARK: - Lifeycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        configureCalenderNavigation()
        hideKeyboardWhenTappedAround()
        calenderSetupUI()
        fetchAllData()
        fetchFeedingData()
        fetchDiaperData()
        fetchSleepData()
    }
    
    func fetchAllData(){
       
    }
    func fetchFeedingData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Feeding")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let time = result.value(forKey: "time") as? String {
                    self.feedingData.append(time)
                }
            }
        } catch {
            print("catche yakalandın ve düştü kardeşim - fetch data")
        }
    }
    func fetchDiaperData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Diaper")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let time = result.value(forKey: "time") as? String {
                    self.diaperData.append(time)
                }
            }
        } catch {
            print("catche yakalandın ve düştü kardeşim - fetch data")
        }
    }
    func fetchSleepData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Sleep")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let time = result.value(forKey: "wokeUp") as? String {
                    self.sleepData.append(time)
                }
            }
        } catch {
            print("catche yakalandın ve düştü kardeşim - fetch data")
        }
    }
    
    @objc func calenderSetupUI(){
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalToSuperview()
        }
        view.addSubview(titleAllButton)
        titleAllButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.left.equalTo(52)
        }
        view.addSubview(feedingButton)
        feedingButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.left.equalTo(titleAllButton.snp.right).offset(55)
            
        }
        view.addSubview(diaperButton)
        diaperButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(28)
            make.left.equalTo(feedingButton.snp.right).offset(61)
            
        }
        view.addSubview(sleepButton)
        sleepButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.left.equalTo(diaperButton.snp.right).offset(56)
        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleAllButton.snp.bottom).offset(24)
            make.left.equalTo(24)
            make.right.equalTo(-24)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
    // Selected method - func
    @objc func handleAllButton(){
        if titleAllButton.isSelected == true {
            titleAllButton.isSelected = false
        } else {
            tableView.reloadData()
            titleAllButton.isSelected = true
            feedingButton.isSelected = false
            diaperButton.isSelected = false
            sleepButton.isSelected = false
        }
    }
    
    @objc func handleFeedingButton(){
        if feedingButton.isSelected == true {
            feedingButton.isSelected = false
        } else {
            tableView.reloadData()
            feedingButton.isSelected = true
            titleAllButton.isSelected = false
            diaperButton.isSelected = false
            sleepButton.isSelected = false
            fetchFeedingData()
        }
    }
    @objc func handleDiaperButton(){
        if diaperButton.isSelected == true {
            diaperButton.isSelected = false
        } else {
            tableView.reloadData()
            diaperButton.isSelected = true
            titleAllButton.isSelected = false
            feedingButton.isSelected = false
            sleepButton.isSelected = false
        }
    }
    @objc func handleSleepButton(){
        if sleepButton.isSelected == true {
            sleepButton.isSelected = false
        } else {
            tableView.reloadData()
            sleepButton.isSelected = true
            titleAllButton.isSelected = false
            feedingButton.isSelected = false
            diaperButton.isSelected = false
        }
    }
    @objc func configureCalenderNavigation(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "btn_back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(backButtonHome))
        navigationItem.titleView = UIImageView(image: UIImage(named: "img_calender")?.withRenderingMode(.alwaysOriginal))
    }
    @objc func backButtonHome(){
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - TableView Extensions

extension CalenderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sleepButton.isSelected {
            return sleepData.count
        }
        if feedingButton.isSelected {
            return feedingData.count
        }
        if diaperButton.isSelected {
            return diaperData.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("tableview custom cell patladı canım")
        }
        cell.contentView.layer.cornerRadius = 25
        if sleepButton.isSelected {
            cell.configure(with: homeData.profileNameLabel.text! , and: sleepData[indexPath.row])
        }
        if feedingButton.isSelected {
            cell.configure(with: homeData.profileNameLabel.text! , and: feedingData[indexPath.row])
        }
        if diaperButton.isSelected {
            cell.configure(with: homeData.profileNameLabel.text! , and: diaperData[indexPath.row])
        }
        //cell.configure(with: homeData.profileNameLabel.text! , and: feedingData[indexPath.row])
        return cell
    }
}
