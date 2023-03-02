//
//  ViewController.swift
//  TextFields
//
//  Created by Mehmet Arıkan on 13.02.2023.
//


// phone number sınır koy

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.textColor = .red
        textField.font = .boldSystemFont(ofSize: 20)
        textField.placeholder = "Enter Name-Surname"
        textField.backgroundColor = .white
        textField.tintColor = .black
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 30
        return textField
    }()
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.textColor = .blue
        textField.font = .italicSystemFont(ofSize: 20)
        textField.placeholder = "Enter Email"
        textField.backgroundColor = .white
        textField.tintColor = .black
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.cornerRadius = 30
        return textField
    }()
    lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.textColor = .green
        textField.font = .boldSystemFont(ofSize: 20)
        textField.placeholder = "Enter Phone Number"
        textField.tintColor = .black
        textField.keyboardType = .numberPad
        textField.attributedText = NSAttributedString(string: "+90", attributes: [NSAttributedString.Key.foregroundColor: UIColor.green, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.green.cgColor
        textField.layer.cornerRadius = 30
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        view.backgroundColor = .systemGray
        setupUI()
        nameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
    }
    
    func setupUI(){
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(phoneNumberTextField)
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.right.equalToSuperview().offset(-50)
            make.left.equalToSuperview().offset(50)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField).offset(100)
            make.right.equalToSuperview().offset(-50)
            make.left.equalToSuperview().offset(50)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField).offset(100)
            make.right.equalToSuperview().offset(-50)
            make.left.equalToSuperview().offset(50)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
            if textField == emailTextField {
                if let text = textField.text, !text.isEmpty {
                    if !text.isValidEmail {
                        let alert = UIAlertController(title: "Invalid Email Format", message: "Please enter a valid email address", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        present(alert, animated: true)
                    }
                }
            }
        }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard textField == phoneNumberTextField else {
            return true
        }
        
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        return newText.count <= 10
    }
}
