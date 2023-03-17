//
//  InAppViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 14.03.2023.
//

//FIXME: - Hem bu sayfa hem next sayfasının navigation barını ayarla
// en alttaki butonların targetlerı boş - ekle
//revenuecat ekle
// weekly ve diğerlerine tıklayınca highleted geliyo onu kaldır

import UIKit
import SnapKit

class InAppViewController: UIViewController {
    //MARK: - Properties
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_close"), for: .normal)
        return button
    }()
    
    lazy var imageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "img_4")
        return image
    }()
    
    lazy var imageDotOne: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon_matter")
        return image
    }()
    
    lazy var imageCub: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img_cubuk")
        return image
    }()
    lazy var imageCubTwo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img_cubuk")
        return image
    }()
    lazy var labelOne: UILabel = {
       let label = UILabel()
        label.text = "Share the care"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    lazy var imageDotTwo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon_matter")
        return image
    }()
    lazy var labelTwo: UILabel = {
       let label = UILabel()
        label.text = "All-in-one baby tracker"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    lazy var imageDotThree: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon_matter")
        return image
    }()
    lazy var labelThree: UILabel = {
       let label = UILabel()
        label.text = "Watch your babys growth"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
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
    
    @objc lazy var startButton: CustomButton = {
       let button = CustomButton()
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(startedButton), for: .touchUpInside)
        return button
    }()
    
    lazy var privacyPolicyButton: UILabel = {
        let label = UILabel()
        label.text = "Privacy Policy"
        label.textColor = .black
        label.font = .systemFont(ofSize: 10, weight: .regular)
        let tap = UITapGestureRecognizer(target: self, action: #selector(InAppViewController.handlePrivacyPolicy))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        label.isEnabled = true
        label.underline()
        return label
    }()
    
    lazy var restorePuchaseButton: UILabel = {
        let label = UILabel()
        label.text = "Restore Purchase"
        label.textColor = .black
        label.font = .systemFont(ofSize: 10, weight: .regular)
        let tap = UITapGestureRecognizer(target: self, action: #selector(InAppViewController.handleRestorePuchase))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        label.isEnabled = true
        label.underline()
        return label
    }()
    lazy var termsOfUseButton: UILabel = {
        let label = UILabel()
        label.text = "Terms of Use"
        label.textColor = .black
        label.font = .systemFont(ofSize: 10, weight: .regular)
        let tap = UITapGestureRecognizer(target: self, action: #selector(InAppViewController.handleTermsOfUse))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        label.isEnabled = true
        label.underline()
        return label
    }()
    
    lazy var weeklyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_unselected_weekly")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.setImage(UIImage(named: "img_selected_weekly")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(handleWeeklyButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    lazy var monthlyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_unselected_monthly")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.setImage(UIImage(named: "img_selected_monthly")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(handleMonthlyButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    lazy var annualButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_unselected_annual")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.setImage(UIImage(named: "img_selected_annual")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(handleAnnualButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    //MARK: - Lifeycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        configureUI()
        configureNavigation()
    }
    
    //MARK: - Helpers
    @objc func handleWeeklyButton(){
        if weeklyButton.isSelected == true {
            weeklyButton.isSelected = false
        } else {
            weeklyButton.isSelected = true
            monthlyButton.isSelected = false
            annualButton.isSelected = false
        }
    }
    @objc func handleMonthlyButton(){
        if monthlyButton.isSelected == true {
            monthlyButton.isSelected = false
        } else {
            monthlyButton.isSelected = true
            weeklyButton.isSelected = false
            annualButton.isSelected = false
        }
    }

    @objc func handleAnnualButton(){
        if annualButton.isSelected == true {
            annualButton.isSelected = false
        } else {
            annualButton.isSelected = true
            weeklyButton.isSelected = false
            monthlyButton.isSelected = false
        }
    }

    @objc func handleRestorePuchase(){

    }
    
    @objc func handlePrivacyPolicy(){
        
    }
    
    @objc func handleTermsOfUse(){
        
    }
    @objc func configureNavigation(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "btn_close")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(backButtonHome))
        navigationItem.titleView = UIImageView(image: UIImage(named: "img_premiumTitle")?.withRenderingMode(.alwaysOriginal))
    }
    @objc func backButtonHome(){
        let vc = LoginInformationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func startedButton(){
        let vc = LoginInformationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    func configureUI(){
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(18)
            make.centerX.equalToSuperview().offset(-20)
        }
        
        let stackOne = UIStackView(arrangedSubviews: [imageDotOne, labelOne])
        stackOne.axis = .horizontal
        stackOne.spacing = -10
        
        let stackTwo = UIStackView(arrangedSubviews: [imageDotTwo, labelTwo])
        stackTwo.axis = .horizontal
        stackTwo.spacing = -10
        
        let stackThree = UIStackView(arrangedSubviews: [imageDotThree, labelThree])
        stackThree.axis = .horizontal
        stackThree.spacing = -10
        view.addSubview(stackOne)
        view.addSubview(stackTwo)
        view.addSubview(stackThree)
        
        
        stackOne.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalTo(80)
        }
        
        stackTwo.snp.makeConstraints { make in
            make.top.equalTo(stackOne.snp.top).offset(32)
            make.leading.equalTo(80)
        }
        stackThree.snp.makeConstraints { make in
            make.top.equalTo(stackTwo.snp.top).offset(32)
            make.leading.equalTo(80)
        }
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(stackThree.snp.bottom).offset(16)
            make.centerX.equalTo(view.center)
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        view.addSubview(weeklyButton)
        weeklyButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top).offset(24)
            make.left.equalTo(28)
            make.right.equalTo(-28)
        }
        view.addSubview(monthlyButton)
        monthlyButton.snp.makeConstraints { make in
            make.top.equalTo(weeklyButton.snp.bottom).offset(32)
            make.left.equalTo(28)
            make.right.equalTo(-28)
        }
        view.addSubview(annualButton)
        annualButton.snp.makeConstraints { make in
            make.top.equalTo(monthlyButton.snp.bottom).offset(32)
            make.left.equalTo(28)
            make.right.equalTo(-28)
        }
        view.addSubview(privacyPolicyButton)
        privacyPolicyButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.left.equalToSuperview().offset(64)
        }
        view.addSubview(imageCub)
        imageCub.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.left.equalTo(privacyPolicyButton.snp.right).offset(8)
        }
        view.addSubview(restorePuchaseButton)
        restorePuchaseButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.left.equalTo(imageCub.snp.right).offset(8)
        }
        view.addSubview(imageCubTwo)
        imageCubTwo.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.left.equalTo(restorePuchaseButton.snp.right).offset(8)
        }
        view.addSubview(termsOfUseButton)
        termsOfUseButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.left.equalTo(imageCubTwo.snp.right).offset(8)
        }
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(privacyPolicyButton.snp.top).offset(-20)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.height.equalTo(startButton.snp.width).multipliedBy(0.18)
        }
    
    }
}
