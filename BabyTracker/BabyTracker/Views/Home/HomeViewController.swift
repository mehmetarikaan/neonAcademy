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
import CoreData

class HomeViewController: UIViewController {
    //MARK: - Properties
    var userArray = [String]()
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
        label.text = ""
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
        button.addTarget(self, action: #selector(tapFeeding), for: .touchUpInside)
        return button
    }()
    
    lazy var diaperButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "diaper_all"), for: .normal)
        button.addTarget(self, action: #selector(tapDiaper), for: .touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var sleepButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "sleep_all"), for: .normal)
        button.addTarget(self, action: #selector(tapSleep), for: .touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    //MARK: - Lifeycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = false
        configureBarItems()
        createdHomeUI()
        fetchData()
        print("viewDidLoad")
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
        plusPhotoButton.layer.cornerRadius = 74/2
        plusPhotoButton.clipsToBounds = true
        plusPhotoButton.contentMode = .scaleAspectFill
        
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
    func fetchData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do{
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let name = result.value(forKey: "babyFullName") as? String {
                    //self.userArray.append(name)
//                    context.delete(result)
//                    do {
//                        try context.save()
//                    } catch {
//
//                    }
                    profileNameLabel.text = name
                }
                if let profileImageFetch = result.value(forKey: "profileImage") as? Data {
                    plusPhotoButton.setImage(UIImage(data: profileImageFetch), for: .normal)
                }
            }
        } catch {
            
        }
    }
    func configureBarItems(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(named: "btn_settings"), target: self, action: #selector(handleSetting))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(named: "btn_calender"), target: self, action: #selector(handleCalender))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    @objc func handleSetting(){
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func handleCalender(){
        let vc = CalenderViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func handleEditProfile(){
        print("sdfsdf")
        let vc = EditViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func tapFeeding(){
        let vc = FeedingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func tapDiaper(){
        let vc = DiaperChangeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func tapSleep(){
        let vc = SleepViewController()
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
