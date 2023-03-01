//
//  ViewController.swift
//  CoreDataChallange
//
//  Created by Mehmet Arıkan on 1.03.2023.
//

import UIKit
import SnapKit
import CoreData

class ViewController: UIViewController {
    //MARK: - Properties
    private lazy var nameTextField = CustomTextField(placeholder: "Enter Name", color: .gray, fontme: .systemFont(ofSize: 18, weight: .black), keyboardtype: .default)
    private lazy var surnameTextField = CustomTextField(placeholder: "Enter Surname", color: .gray, fontme: .systemFont(ofSize: 18, weight: .black), keyboardtype: .default)
    private lazy var ageTextField = CustomTextField(placeholder: "Enter Age", color: .gray, fontme: .systemFont(ofSize: 18, weight: .black), keyboardtype: .numberPad)
    private lazy var emailTextField = CustomTextField(placeholder: "Enter E-mail", color: .gray, fontme: .systemFont(ofSize: 18, weight: .black), keyboardtype: .default)
    
    private lazy var addedButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.tintColor = .purple
        button.titleLabel?.textColor = .purple
        button.setTitleColor(.purple, for: .normal)
        button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func handleSave(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Team", into: context)
        
        //Save core data
        saveData.setValue(nameTextField.text!, forKey: "name")
        saveData.setValue(surnameTextField.text!, forKey: "surname")
        saveData.setValue(emailTextField.text!, forKey: "email")
        saveData.setValue(UUID(), forKey: "id")
        
        if let ages = Int(ageTextField.text!){
            saveData.setValue(ages, forKey: "age")
        }
        
        do {
            try context.save()
            print("kaydedili karsimmmmm")
        } catch {
            print("hatasız kul olmaz kardes")
        }
    }
    
    func setupUI(){
        navigationItem.title = "Core Data Challenge"
        view.backgroundColor = .purple
        
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
        view.addSubview(surnameTextField)
        surnameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
        view.addSubview(ageTextField)
        ageTextField.snp.makeConstraints { make in
            make.top.equalTo(surnameTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(ageTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
        view.addSubview(addedButton)
        addedButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(90)
            make.trailing.equalToSuperview().inset(90)
            make.height.equalTo(40)
            make.width.equalTo(20)
        }
    }
}

