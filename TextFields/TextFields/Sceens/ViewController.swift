//
//  ViewController.swift
//  TextFields
//
//  Created by Mehmet Arıkan on 13.02.2023.
//


import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate{
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.textColor = .red
        textField.font = .boldSystemFont(ofSize: 20)
        textField.placeholder = "Enter Name-Surname"
        textField.backgroundColor = .white
        textField.tintColor = .black
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
    }
    
    //TASK ONE - Back or Closed button
    func textFieldShouldReturn(_ nameTextField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
            return true
        }
    func textField(_ phoneNumberTextField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = phoneNumberTextField.text ?? ""
            let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
            return prospectiveText.count <= 10
        }
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        if !emailTest.evaluate(with: emailTextField.text) {
//            let errorMessage = "Invalid email format"
//            // Show error message to the user, for example using an alert
//            let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alert.addAction(okAction)
//            present(alert, animated: true, completion: nil)
//            return self
//        }
//    }
    func textFieldDidEndEditing(_ emailTextField: UITextField) {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            if !emailTest.evaluate(with: emailTextField.text) {
                let errorMessage = "Invalid email format"
                // Show error message to the user, for example using an alert
                let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
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

