//
//  SettingsViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 17.03.2023.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    
    lazy var getPremiumButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_getpremium")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        //button.addTarget(self, action: #selector(handleGirlBabyButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var getRateUsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_rateus")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        //button.addTarget(self, action: #selector(handleGirlBabyButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    lazy var getTermsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_terms")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        //button.addTarget(self, action: #selector(handleGirlBabyButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var getPrivacyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_privacy")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        //button.addTarget(self, action: #selector(handleGirlBabyButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var getContactButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_contact")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        //button.addTarget(self, action: #selector(handleGirlBabyButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var getRestoreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_restore")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        //button.addTarget(self, action: #selector(handleGirlBabyButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuredSettingsNavigation()
        settingsUI()
    }
    
    @objc func settingsUI(){
        view.backgroundColor = .white
        view.addSubview(getPremiumButton)
        getPremiumButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }
        view.addSubview(getRateUsButton)
        getRateUsButton.snp.makeConstraints { make in
            make.top.equalTo(getPremiumButton.snp.bottom).offset(20)
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }
        view.addSubview(getTermsButton)
        getTermsButton.snp.makeConstraints { make in
            make.top.equalTo(getRateUsButton.snp.bottom).offset(20)
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }
        view.addSubview(getPrivacyButton)
        getPrivacyButton.snp.makeConstraints { make in
            make.top.equalTo(getTermsButton.snp.bottom).offset(20)
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }
        view.addSubview(getContactButton)
        getContactButton.snp.makeConstraints { make in
            make.top.equalTo(getPrivacyButton.snp.bottom).offset(20)
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }
        view.addSubview(getRestoreButton)
        getRestoreButton.snp.makeConstraints { make in
            make.top.equalTo(getContactButton.snp.bottom).offset(20)
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }

    }
    
    @objc func configuredSettingsNavigation(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "btn_back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(backButtonHome))
        navigationItem.titleView = UIImageView(image: UIImage(named: "img_settings")?.withRenderingMode(.alwaysOriginal))
    }

    @objc func backButtonHome(){
        navigationController?.popViewController(animated: true)
    }

}
