//
//  ViewController.swift
//  AlertsChallange
//
//  Created by Mehmet Arıkan on 14.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var labelButton: UILabel = {
       let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30)
        label.textColor = .red
        return label
    }()
    
    lazy var buttonsOne: UIButton = {
        let button = UIButton()
        button.setTitle("Clicked me One!", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonPressedOne), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonsTwo: UIButton = {
        let button = UIButton()
        button.setTitle("Clicked me Two!", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonPressedTwo), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonsThree: UIButton = {
        let button = UIButton()
        button.setTitle("Clicked me Three!", for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonPressedThree), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonsFor: UIButton = {
        let button = UIButton()
        button.setTitle("Clicked me For!", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonPressedFor), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        view.addSubview(labelButton)
        view.addSubview(buttonsOne)
        view.addSubview(buttonsTwo)
        view.addSubview(buttonsThree)
        view.addSubview(buttonsFor)

        
        labelButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(100)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        buttonsOne.snp.makeConstraints { make in
            make.top.equalTo(labelButton).offset(100)
            make.left.equalToSuperview().offset(100)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        buttonsTwo.snp.makeConstraints { make in
            make.bottom.equalTo(buttonsOne).offset(100)
            make.left.equalToSuperview().offset(100)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        buttonsThree.snp.makeConstraints { make in
            make.bottom.equalTo(buttonsTwo).offset(100)
            make.left.equalToSuperview().offset(100)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        buttonsFor.snp.makeConstraints { make in
            make.bottom.equalTo(buttonsThree).offset(100)
            make.left.equalToSuperview().offset(100)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }

    }
    //Alerts
    func displayedAlertOne(){
        let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    func displayedAlertTwo(){
        let alert = UIAlertController(title: "I am title!", message: "Mehmet Arıkan", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Added", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.cancel))
        self.present(alert, animated: true, completion: nil)
        labelButton.text = alert.title
    }
    func displayedAlertThree(){
        let alert = UIAlertController(title: "I am textfield!", message: "Mehmet Arıkan", preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter First Name"
        }
        alert.addAction(UIAlertAction(title: "Added", style: UIAlertAction.Style.default, handler: { UIAlertAction in
            let result = alert.textFields![0]
            self.labelButton.text = result.text
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayedAlertFor(){
        let activity  = UIActivityViewController(activityItems: [self], applicationActivities: nil)
        present(activity, animated: true)
    }


    
    
    //ButtonActions
    
    @objc func buttonPressedOne(_ sender: UIButton){
        displayedAlertOne()
    }
    
    @objc func buttonPressedTwo(_ sender: UIButton){
        displayedAlertTwo()
    }
    
    @objc func buttonPressedThree(_ sender: UIButton){
        displayedAlertThree()
        
    }
    @objc func buttonPressedFor(_ sender: UIButton){
        displayedAlertFor()
        
    }

    
}


