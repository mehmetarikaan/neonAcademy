//
//  HomeViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 16.03.2023.
//

//FIXME: - Navigation itemlerin actionlarını bağla

// profil resmine core data ile görseli çek

//Edit Profile guster ekle

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    //MARK: - Properties
    lazy var plusPhotoButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "img_photo"), for: .normal)
        button.contentMode = .scaleAspectFit
        //button.addTarget(self, action: #selector(handleProfilePhotoSelected), for: .touchUpInside)
        return button
    }()
    
    lazy var editProfileButton: UILabel = {
        let label = UILabel()
        label.text = "Edit Profile"
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 13, weight: .medium)
        let tap = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.handleEditProfile))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        label.isEnabled = true
        label.underline()
        return label
    }()
    
    lazy var profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Joe"
        label.textColor = #colorLiteral(red: 0.29512766, green: 0.1368008852, blue: 0.7957670093, alpha: 1)
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    lazy var babyAgeLabel: UILabel = {
        let label = UILabel()
        label.text = "44 Months 17 Days"
        label.textColor = #colorLiteral(red: 0.003921568859, green: 0.003921568859, blue: 0.003921568859, alpha: 1)
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var backgroundView: UIView = {
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        bgView.layer.cornerRadius = 25
        bgView.backgroundColor = .white
        bgView.layer.shadowOpacity = 0.1
        bgView.layer.shadowOffset = .zero
        bgView.layer.shadowRadius = 5
        return bgView
    }()
    
    lazy var feedingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "feeding_all"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var diaperButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "diaper_all"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var sleepButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "sleep_all"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    //MARK: - Lifeycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBarItems()
        createdHomeUI()
    }
    //MARK: - Actions
    func createdHomeUI(){
        view.backgroundColor = .white
        view.addSubview(plusPhotoButton)
        plusPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.height.equalTo(74)
            make.width.equalTo(74)
            make.centerX.equalToSuperview()
        }
        view.addSubview(editProfileButton)
        editProfileButton.snp.makeConstraints { make in
            make.top.equalTo(plusPhotoButton.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        view.addSubview(profileNameLabel)
        profileNameLabel.snp.makeConstraints { make in
            make.top.equalTo(editProfileButton.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        view.addSubview(babyAgeLabel)
        babyAgeLabel.snp.makeConstraints { make in
            make.top.equalTo(profileNameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(babyAgeLabel.snp.bottom).offset(16)
            make.centerX.equalTo(view.center)
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        view.addSubview(feedingButton)
        feedingButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top).offset(16)
            make.height.equalTo(63)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().inset(24)
        }
        view.addSubview(diaperButton)
        diaperButton.snp.makeConstraints { make in
            make.top.equalTo(feedingButton.snp.bottom).offset(16)
            make.height.equalTo(63)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().inset(24)
        }
        view.addSubview(sleepButton)
        sleepButton.snp.makeConstraints { make in
            make.top.equalTo(diaperButton.snp.bottom).offset(16)
            make.height.equalTo(63)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().inset(24)
        }
    }
    func configureBarItems(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(named: "btn_settings"), target: self, action: #selector(handleSetting))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(named: "btn_calender"), target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    @objc func handleSetting(){
        
    }
    @objc func handleEditProfile(){
        print("sdfsdf")
        let vc = EditViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: Extension - UILabel

extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}
