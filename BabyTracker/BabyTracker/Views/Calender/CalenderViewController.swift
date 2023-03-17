//
//  CalenderViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 16.03.2023.
//

//FIXME: - TableView Ekle - Custom Cell yaz

import UIKit
import SnapKit

class CalenderViewController: UIViewController {
    //MARK: - Properties
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Tue, Feb 12"
        title.font = .systemFont(ofSize: 20, weight: .medium)
        return title
    }()
    lazy var titleAllButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_unselected_all")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.setImage(UIImage(named: "img_selected_all")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(handleAllButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var feedingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_unselected_feeding")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.setImage(UIImage(named: "img_selected_feeding")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(handleFeedingButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    lazy var diaperButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_unselected_diaperc")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.setImage(UIImage(named: "img_selected_diaperc")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(handleDiaperButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    lazy var sleepButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_unselected_sleep")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.setImage(UIImage(named: "img_selected_sleep")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(handleSleepButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()

    //MARK: - Lifeycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCalenderNavigation()
        hideKeyboardWhenTappedAround()
        calenderSetupUI()
    }
    @objc func calenderSetupUI(){
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalToSuperview()
        }
        view.addSubview(titleAllButton)
        titleAllButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.left.equalTo(52)
        }
        view.addSubview(feedingButton)
        feedingButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.left.equalTo(titleAllButton.snp.right).offset(55)
            
        }
        view.addSubview(diaperButton)
        diaperButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(28)
            make.left.equalTo(feedingButton.snp.right).offset(61)
            
        }
        view.addSubview(sleepButton)
        sleepButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.left.equalTo(diaperButton.snp.right).offset(56)
        }
    }
    
    // Selected method - func
    @objc func handleAllButton(){
        if titleAllButton.isSelected == true {
            titleAllButton.isSelected = false
        } else {
            titleAllButton.isSelected = true
            feedingButton.isSelected = false
            diaperButton.isSelected = false
            sleepButton.isSelected = false
        }
    }
    
    @objc func handleFeedingButton(){
        if feedingButton.isSelected == true {
            feedingButton.isSelected = false
        } else {
            feedingButton.isSelected = true
            titleAllButton.isSelected = false
            diaperButton.isSelected = false
            sleepButton.isSelected = false
        }
    }
    @objc func handleDiaperButton(){
        if diaperButton.isSelected == true {
            diaperButton.isSelected = false
        } else {
            diaperButton.isSelected = true
            titleAllButton.isSelected = false
            feedingButton.isSelected = false
            sleepButton.isSelected = false
        }
    }
    @objc func handleSleepButton(){
        if sleepButton.isSelected == true {
            sleepButton.isSelected = false
        } else {
            sleepButton.isSelected = true
            titleAllButton.isSelected = false
            feedingButton.isSelected = false
            diaperButton.isSelected = false
        }
    }
    @objc func configureCalenderNavigation(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "btn_back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(backButtonHome))
        navigationItem.titleView = UIImageView(image: UIImage(named: "img_calender")?.withRenderingMode(.alwaysOriginal))
    }
    @objc func backButtonHome(){
        navigationController?.popViewController(animated: true)
    }
}
