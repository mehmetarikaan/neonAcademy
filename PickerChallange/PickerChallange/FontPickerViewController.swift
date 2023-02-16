//
//  FontPickerViewController.swift
//  PickerChallange
//
//  Created by Mehmet Arıkan on 16.02.2023.
//

import UIKit

class FontPickerViewController: UIViewController, UIFontPickerViewControllerDelegate {
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make"
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        nameLabel.textColor = .systemRed
        nameLabel.font = .systemFont(ofSize: 20)
        return nameLabel
    }()
    lazy var myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click me!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 20
        button.tintColor = .white
        button.addTarget(self, action: #selector(buttonFontPicker), for: .touchUpInside)
        
        return button
    }()
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click me! and Next!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        button.tintColor = .black
        button.addTarget(self, action: #selector(nextPicker), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFont()
    }
    
    func setupFont(){
        view.addSubview(nameLabel)
        view.addSubview(myButton)
        view.addSubview(nextButton)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        myButton.snp.makeConstraints { make in
            make.bottom.equalTo(nameLabel).offset(100)
            make.trailing.equalTo(-50)
            make.leading.equalTo(50)
        }
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(myButton).offset(100)
            make.trailing.equalTo(-50)
            make.leading.equalTo(50)
        }
    }
    @objc func nextPicker(){
        let controlDate = DatePickerViewController()
        navigationController?.pushViewController(controlDate, animated: true)
        
    }
    @objc func buttonFontPicker(){
        let config = UIFontPickerViewController.Configuration()
        config.includeFaces = false
        let vc = UIFontPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
    }
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true, completion: nil)
        let descrpitor = viewController.selectedFontDescriptor
        nameLabel.font = UIFont(descriptor: descrpitor!, size: 20)
    }
}
