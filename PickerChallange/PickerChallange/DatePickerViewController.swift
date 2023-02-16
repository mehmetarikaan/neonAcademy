//
//  DatePickerViewController.swift
//  PickerChallange
//
//  Created by Mehmet Arıkan on 16.02.2023.
//

import UIKit
import SnapKit

class DatePickerViewController: UIViewController {
    lazy var txtDatePicker: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Enter Birth Day!"
        text.font = .systemFont(ofSize: 20)
        text.borderStyle = .roundedRect
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.frame.size = CGSize(width: 0, height: 250)
        text.inputView = datePicker
        datePicker.addTarget(self, action: #selector(valueChangedPicker), for: .valueChanged)
        return text
    }()
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click me! and Next!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        button.tintColor = .black
        button.addTarget(self, action: #selector(nextPickerLast), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDate()
    }
    
    func setupDate(){
        view.addSubview(txtDatePicker)
        view.addSubview(nextButton)
        
        txtDatePicker.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(txtDatePicker).offset(100)
            make.trailing.equalTo(-50)
            make.leading.equalTo(50)
        }
    }
    
    @objc func valueChangedPicker(sender: UIDatePicker){
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .long
        dateFormat.timeStyle = .none
        self.txtDatePicker.text = dateFormat.string(from: sender.date)
        
    }
    
    @objc func nextPickerLast(){
        let controlColor = ColorViewController()
        navigationController?.pushViewController(controlColor, animated: true)
        
    }
    
}
