//
//  SleepViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 16.03.2023.
//

import UIKit
import SnapKit

class SleepViewController: UIViewController {
    
    //MARK: - Properties
    private let indentView = UIView(frame: CGRect(x: 0, y:0, width: 20, height: 10))
    
    lazy var feelSleepField: CustomTextField = {
       let textfield = CustomTextField()
        textfield.placeholder = "Fell Sleep"
        textfield.contentMode = .left
        let datePickerTime = UIDatePicker()
        datePickerTime.datePickerMode = .time
        datePickerTime.preferredDatePickerStyle = .wheels
        datePickerTime.frame.size = CGSize(width: 0, height: 250)
        textfield.inputView = datePickerTime
        datePickerTime.addTarget(self, action: #selector(valueChangedFeelSleep), for: .valueChanged)
        return textfield
    }()
    
    lazy var wokeUpField: CustomTextField = {
       let textfield = CustomTextField()
        textfield.placeholder = "Woke Up"
        textfield.contentMode = .left
        let datePickerTime = UIDatePicker()
        datePickerTime.datePickerMode = .time
        datePickerTime.preferredDatePickerStyle = .wheels
        datePickerTime.frame.size = CGSize(width: 0, height: 250)
        textfield.inputView = datePickerTime
        datePickerTime.addTarget(self, action: #selector(tapWokeUpField), for: .valueChanged)

        return textfield
    }()
    
    lazy var noteField: UITextField = {
       let textView = UITextField()
        textView.attributedPlaceholder = NSAttributedString(string: "Note")
        textView.backgroundColor = #colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)
        textView.leftView = UIView(frame: CGRect(x: 25, y: -20, width: 0, height: 0))
        textView.textColor = #colorLiteral(red: 0.7372547984, green: 0.737255156, blue: 0.745862782, alpha: 1)
        textView.font = .systemFont(ofSize: 14)
        textView.layer.cornerRadius = 25
        return textView
    }()

    
    lazy var saveButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(UIColor.white,for: .normal)
        button.isEnabled = true
        button.addTarget(self, action: #selector(tapedSaveButton), for: .touchUpInside)
        return button
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        feedingSetupUI()
        hideKeyboardWhenTappedAround()
    }
    
    //MARK: - Actions
    func feedingSetupUI(){
        view.backgroundColor = .white
        view.addSubview(feelSleepField)
        feelSleepField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.right.equalToSuperview().inset(24)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(60)
        }
        view.addSubview(wokeUpField)
        wokeUpField.snp.makeConstraints { make in
            make.top.equalTo(feelSleepField.snp.bottom).offset(32)
            make.right.equalToSuperview().inset(24)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(60)
        }

        view.addSubview(noteField)
        noteField.snp.makeConstraints { make in
            make.top.equalTo(wokeUpField.snp.bottom).offset(32)
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
    
    @objc func tapedSaveButton(){
        
    }
    
    @objc func valueChangedFeelSleep(sender: UIDatePicker){
        let datePickerTime = DateFormatter()
        datePickerTime.dateStyle = .none
        datePickerTime.timeStyle = .long
        datePickerTime.dateFormat = "HH:mm a"
        self.feelSleepField.text = datePickerTime.string(from: sender.date)
    }
    @objc func tapWokeUpField(sender: UIDatePicker){
        let datePickerTime = DateFormatter()
        datePickerTime.dateStyle = .none
        datePickerTime.timeStyle = .long
        datePickerTime.dateFormat = "HH:mm a"
        self.wokeUpField.text = datePickerTime.string(from: sender.date)
        
    }
    @objc func configureNavigation(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "btn_back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(backButtonHome))
        navigationItem.titleView = UIImageView(image: UIImage(named: "img_sleep")?.withRenderingMode(.alwaysOriginal))
    }

    @objc func backButtonHome(){
        navigationController?.popViewController(animated: true)
    }
    
//    func textViewDidEndEditing (textView: UITextView) {
//
//        noteField.text = ""
//        noteField.textColor = .white
//
//    }
//    func textViewDidBeginEditing (textView: UITextView) {
//        if noteField.text.isEmpty || noteField.text == "" {
//            noteField.textColor = .lightGray
//            noteField.text = ""
//        }
//    }
}


