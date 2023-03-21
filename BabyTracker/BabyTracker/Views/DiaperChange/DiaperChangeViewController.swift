//
//  DiaperChangeViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 16.03.2023.
//

//MARK: - Note kısmını düzelt
// loading kısmını düzelt

import UIKit
import SnapKit
import CoreData

class DiaperChangeViewController: UIViewController {
    //MARK: - Properties
    lazy var timeField: CustomTextField = {
       let textfield = CustomTextField()
        textfield.placeholder = "Time"
        textfield.contentMode = .left
        let datePickerTime = UIDatePicker()
        datePickerTime.datePickerMode = .time
        datePickerTime.preferredDatePickerStyle = .wheels
        datePickerTime.frame.size = CGSize(width: 0, height: 250)
        textfield.inputView = datePickerTime
        datePickerTime.addTarget(self, action: #selector(valueChangedtimePicker), for: .valueChanged)
        return textfield
    }()
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Diaper Status"
        title.textColor = .black
        title.textAlignment = .left
        title.font = .systemFont(ofSize: 15, weight: .semibold)
        return title
    }()
    private lazy var wetButton = CustomSelectedButton(normal: "img_unselected_wet", selected: "img_selected_wet")
    private lazy var dirtyButton = CustomSelectedButton(normal: "img_unselected_dirty", selected: "img_selected_dirty")
    private lazy var mixedButton = CustomSelectedButton(normal: "img_unselected_mixed", selected: "img_selected_mixed")
    private lazy var dryButton = CustomSelectedButton(normal: "img_unselected_dry", selected: "img_selected_dry")
    private lazy var noteField = CustomNoteTextView()
    private lazy var saveButton = CustomButton(title: "Save")
    
    //MARK: - Lifeycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDiaperNavigation()
        diaperSetupUI()
        hideKeyboardWhenTappedAround()
    }
    
    //MARK: - Actions
    func diaperSetupUI(){
        wetButton.addTarget(self, action: #selector(handleWetButton), for: UIControl.Event.touchUpInside)
        saveButton.addTarget(self, action: #selector(tapedSaveButton), for: .touchUpInside)
        dirtyButton.addTarget(self, action: #selector(handleDirtyButton), for: UIControl.Event.touchUpInside)
        mixedButton.addTarget(self, action: #selector(handleMixedButton), for: UIControl.Event.touchUpInside)
        dryButton.addTarget(self, action: #selector(handleDryButton), for: UIControl.Event.touchUpInside)

        view.backgroundColor = .white
        view.addSubview(timeField)
        timeField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.right.equalToSuperview().inset(24)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(60)
        }
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(timeField.snp.bottom).offset(30)
            make.left.equalTo(48)
        }
        view.addSubview(wetButton)
        wetButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalTo(titleLabel.snp.left)
        }
        view.addSubview(dirtyButton)
        dirtyButton.snp.makeConstraints { make in
            make.top.equalTo(wetButton.snp.bottom).offset(20)
            make.left.equalTo(wetButton.snp.left)
        }
        view.addSubview(mixedButton)
        mixedButton.snp.makeConstraints { make in
            make.top.equalTo(dirtyButton.snp.bottom).offset(20)
            make.left.equalTo(dirtyButton.snp.left)
        }
        view.addSubview(dryButton)
        dryButton.snp.makeConstraints { make in
            make.top.equalTo(mixedButton.snp.bottom).offset(20)
            make.left.equalTo(mixedButton.snp.left)
        }
        view.addSubview(noteField)
        noteField.snp.makeConstraints { make in
            make.top.equalTo(dryButton.snp.bottom).offset(50)
            make.right.equalToSuperview().inset(24)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(264)
        }
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
            make.right.equalToSuperview().inset(40)
            make.left.equalToSuperview().offset(40)
            make.height.equalTo(saveButton.snp.width).multipliedBy(0.18)
        }
    }
    @objc func handleWetButton(){
        if wetButton.isSelected == true {
            wetButton.isSelected = false
        } else {
            wetButton.isSelected = true
            dirtyButton.isSelected = false
            mixedButton.isSelected = false
            dryButton.isSelected = false
        }
    }
    @objc func handleDirtyButton(){
        if dirtyButton.isSelected == true {
            dirtyButton.isSelected = false
        } else {
            dirtyButton.isSelected = true
            wetButton.isSelected = false
            mixedButton.isSelected = false
            dryButton.isSelected = false
        }
    }
    @objc func handleMixedButton(){
        if mixedButton.isSelected == true {
            mixedButton.isSelected = false
        } else {
            mixedButton.isSelected = true
            wetButton.isSelected = false
            dirtyButton.isSelected = false
            dryButton.isSelected = false
        }
    }
    @objc func handleDryButton(){
        if dryButton.isSelected == true {
            dryButton.isSelected = false
        } else {
            dryButton.isSelected = true
            wetButton.isSelected = false
            dirtyButton.isSelected = false
            mixedButton.isSelected = false
        }
    }
    @objc func tapedSaveButton(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Diaper", into: context)
        
        //Save core data
        saveData.setValue(String(timeField.text!), forKey: "time")
        //saveData.setValue(String(noteField.text!), forKey: "amount")
        saveData.setValue(String(noteField.text!), forKey: "note")
        
        //saveData.setValue(UUID(), forKey: "id")
        
//        if let ages = Int(ageTextField.text!){
//            saveData.setValue(ages, forKey: "age")
//        }
        
        do {
            try context.save()
            print("kaydedili karsimmmmm")
        } catch {
            print("hatasız kul olmaz kardes")
        }
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func configureDiaperNavigation(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "btn_back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(backButtonHome))
        navigationItem.titleView = UIImageView(image: UIImage(named: "img_diaper")?.withRenderingMode(.alwaysOriginal))
    }
    @objc func backButtonHome(){
        navigationController?.popViewController(animated: true)
    }
    @objc func valueChangedtimePicker(sender: UIDatePicker){
        let datePickerTime = DateFormatter()
        datePickerTime.dateStyle = .none
        datePickerTime.timeStyle = .long
        datePickerTime.dateFormat = "HH:mm a"
        self.timeField.text = datePickerTime.string(from: sender.date)
    }

}
