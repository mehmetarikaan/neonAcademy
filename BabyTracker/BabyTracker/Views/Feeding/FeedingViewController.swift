//
//  FeedingViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 16.03.2023.
//

//FIXME: - Note kısmı UItextview olarak eklendi tam olarak çalışmıyor. Pozisyonunu ayarla.
// Save Butonu loading animasyonu 

import UIKit
import SnapKit

class FeedingViewController: UIViewController {
    
    //MARK: - Properties
    private let indentView = UIView(frame: CGRect(x: 0, y:0, width: 20, height: 10))
    
    lazy var timeField: CustomTextField = {
       let textfield = CustomTextField()
        textfield.placeholder = "Time"
        textfield.contentMode = .left
        let datePickerTime = UIDatePicker()
        datePickerTime.datePickerMode = .time
        datePickerTime.preferredDatePickerStyle = .wheels
        datePickerTime.frame.size = CGSize(width: 0, height: 250)
        textfield.inputView = datePickerTime
        datePickerTime.addTarget(self, action: #selector(valueChangedtimeFieldPicker), for: .valueChanged)
        return textfield
    }()
    
    lazy var amountField: CustomTextField = {
       let textfield = CustomTextField()
        textfield.placeholder = "Amount (ml)"
        textfield.text = ""
        textfield.keyboardType = .numberPad
        textfield.addTarget(self, action: #selector(valueChangedAmountField), for: .editingDidEnd)

        return textfield
    }()
    
    lazy var noteField: UITextView = {
       let textfield = UITextView()
        textfield.text = "Note"
        textfield.backgroundColor = #colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)
        textfield.textColor = #colorLiteral(red: 0.7372547984, green: 0.737255156, blue: 0.745862782, alpha: 1)
        textfield.font = .systemFont(ofSize: 14)
        textfield.layer.cornerRadius = 25
        textfield.layer.fillMode = .backwards
        return textfield
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
        view.addSubview(timeField)
        timeField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.right.equalToSuperview().inset(24)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(60)
        }
        view.addSubview(amountField)
        amountField.snp.makeConstraints { make in
            make.top.equalTo(timeField.snp.bottom).offset(32)
            make.right.equalToSuperview().inset(24)
            make.left.equalToSuperview().offset(24)
            make.height.equalTo(60)
        }

        view.addSubview(noteField)
        noteField.snp.makeConstraints { make in
            make.top.equalTo(amountField.snp.bottom).offset(32)
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
    
    @objc func valueChangedtimeFieldPicker(sender: UIDatePicker){
        let datePickerTime = DateFormatter()
        datePickerTime.dateStyle = .none
        datePickerTime.timeStyle = .long
        datePickerTime.dateFormat = "HH:mm a"
        self.timeField.text = datePickerTime.string(from: sender.date)
    }
    @objc func valueChangedAmountField(sender: UITextField){
        amountField.text = "\(sender.text!) ml"
        
    }
    @objc func configureNavigation(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "btn_back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(backButtonHome))
        navigationItem.titleView = UIImageView(image: UIImage(named: "img_feeding")?.withRenderingMode(.alwaysOriginal))
    }

    @objc func backButtonHome(){
        navigationController?.popViewController(animated: true)
    }
    
    func textViewDidEndEditing (textView: UITextView) {
        
        noteField.text = ""
        noteField.textColor = .white
        
    }
    func textViewDidBeginEditing (textView: UITextView) {
        if noteField.text.isEmpty || noteField.text == "" {
            noteField.textColor = .lightGray
            noteField.text = ""
        }
    }
}

